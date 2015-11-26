class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource :find_by => :slug, except: [:index, :show]
  before_action :find_video, only: [:show, :edit, :update, :destroy, :update_stats]
  layout 'no_footer', :only => [:new, :edit]
  before_filter :set_rand_cookie
  before_action :update_youtube_stats, only: [:show]
  
  # rescue_from ActiveRecord::RecordNotFound do
  #   flash[:notice] = 'Sorry, that video does not exist'
  #   redirect_to action: :index
  # end
 
  def index
    if params[:query].present?
      # Find videos using elastic search
      @videos = Video.where("status = 'published'").search(params[:query], page: params[:page], :per_page => 16)

    elsif params[:tag].present?
      # Find videos by tag
      @tag = Tag.find_by(name: params[:tag])
      @videos = @tag.videos.where("status = 'published'").paginate(:page => params[:page], :per_page => 16)

    elsif params[:sort].present? and params[:sort] == 'likes' || params[:sort] == 'views'
      # Sort videos baseed on the number of views
      @videos = Video.where("status = 'published'").order("#{params[:sort]} DESC").paginate(:page => params[:page], :per_page => 16)

    elsif params[:uid].present?
      # Check whether this video already exists. This is called when creating a new video, to save the
      # user from wasting time entering details about an existing video.
      # eg: http://localhost:3000/videos.json?uid=AlkKPojdVAk
      @videos = Video.where(:uid => params[:uid]).paginate(:page => params[:page], :per_page => 16)

    else
      # Show videos in random order. Code is from http://nomethoderror.com/blog/2014/02/05/activerecord-random-ordering-with-pagination/
      seed_val = Video.connection.quote(cookies[:rand_seed])
      Video.connection.execute("select setseed(#{seed_val})")
      @videos = Video.where("status = 'published'").order('random()').paginate(:page => params[:page], :per_page => 16)
    end

    # @tags = Tag.where(major: true).order(:name)

    # Respond as JSON, so that this function can be called via AJAX to determine whether a video
    # already exists when creating a new video via http://localhost:3000/videos/new
    respond_to do |format|
      format.html
      if params[:draw].present?
        format.json { render json: VideoDatatable.new(view_context, { user: current_user, role: current_user.role }) }
      else
        format.json { render json: @videos }
      end
    end

  end

  def new
    # If this user can only manage one event, just assign the video to that event
    if current_user.events.count == 1
      @video = Video.new(event: current_user.events.first)
    else
      @video = Video.new
    end
    @tag = Tag.new
  end

  def show
    #Show up to 4 randomly-selected videos which share the same tags. related_videos is calculated in the video.rb model
    @related_videos = @video.related_videos.shuffle[0, 4]
    
    #Customise the Facebook/Twitter sharing content
    @og_title = "IgniteTalks.io" + " | " + @video.title + " by " + @video.speaker_name
    if @video.description.blank?
      @og_description = @video.speaker_name + " speaks at " + @video.event.name
    else
      @og_description = @video.description
    end
    @og_image = "http://img.youtube.com/vi/#{@video.uid}/maxresdefault.jpg"
    @more_videos = Video.all.order("RANDOM()").limit(4)

    respond_to do |format|
      format.html
      format.json { render json: @video }  # respond with the created JSON object
    end

  end

  def edit
  end

  def create
    @video = Video.create(video_params)
    if @video.save
      begin
        # Email the admins to let them know a new video has been added
        User.where(role: Role.where(name: "admin")).each do |user|
          NotifyMailer.new_video_email(user, @video).deliver_now
        end
      rescue
        puts "There was a problem emailing the admins about this video"
      end
      respond_to do |format|
        format.html {
          flash[:notice] = "Video #{@video.title} added successfully."
          redirect_to video_path(@video)
        }
        format.json { render json: @video, status: :created, location: @video }
      end

    else
      respond_to do |format|
        format.html {
          flash[:notice] = @video.errors.full_messages.to_sentence
          render 'new', layout: 'no_footer'
        }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    if [params[:video][:speaker_name], params[:video][:description]].include? "TBA"
      # Videos which are auto-imported have the status 'draft' with unknown Speaker Name and Description.
      # Don't allow videos to be published until that is amended
      @video.status = 'draft'
      flash[:notice] = "Please check the Speaker Name and Description field before publishing"
      redirect_to edit_video_path(@video)
    else
      # Otherwise, publish the video
      @video.status = 'published'
      if @video.update(video_params)

        # Update the video_count of any playlists and tags which hold this video
        @video.playlists.each do |playlist|
          playlist.video_count = playlist.videos.where(status: "published").count
          playlist.save!
        end
        @video.tags.each do |tag|
          tag.video_count = tag.videos.where(status: "published").count
          tag.save!
        end

        if current_user.curator?
          redirect_to admin_path
        else
          redirect_to @video
        end
      else
        flash[:notice] = @video.errors.full_messages.to_sentence
        render 'edit'
      end
    end
  end


  def destroy
    @video.destroy
    flash[:notice] = "Video #{@video.title} deleted successfully."
    redirect_to admin_path
  end

private

  def video_params
    params.require(:video).permit(:title, :description, :url, :event_id, :status, :speaker_name, :speaker_url, :uid, :featured, :R18, :new_tag_name, :new_playlist_name, playlist_ids: [], tag_ids: [])
  end

  def find_video
    @video = Video.friendly.find(params[:id])
  end

  def set_rand_cookie
    return if cookies[:rand_seed].present?
    cookies[:rand_seed] = {value: rand, expires: Time.now + 900}
  end

  def update_youtube_stats
    #Update the view, like and dislike counts
    unless @video.uid.nil?
      begin
        video = Yt::Video.new id: @video.uid
        @video.views = video.view_count | 0
        @video.likes = video.like_count | 0
        @video.dislikes = video.dislike_count | 0
        @video.save
      rescue Exception => e
        print "YouTube API error"
      end
    end
  end

  def validate_before_publishing
    # Before saving a video, verify it no longer has "TBA"
    if [video_params[:speaker_name], video_params[:description]].include? "TBA"
      @video.status = 'draft'
      flash[:notice] = "Please check the Speaker Name and Description field before publishing"
      redirect_to edit_video_path(@video)
    else
      # Once it's published, ensure that any playlists it's in have the correct video_count
      @video.status = 'published'
    end
  end

end
