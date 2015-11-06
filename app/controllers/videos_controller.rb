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
      @videos = Video.search(params[:query], page: params[:page], :per_page => 16)

    elsif params[:tag].present?
      # Find videos by tag
      @tag = Tag.find_by(name: params[:tag])
      @videos = @tag.videos.paginate(:page => params[:page], :per_page => 16)

    elsif params[:sort].present? and params[:sort] == 'likes' || params[:sort] == 'views'
      # Sort videos baseed on the number of views
      @videos = Video.order("#{params[:sort]} DESC").paginate(:page => params[:page], :per_page => 16)

    elsif params[:uid].present?
      # Check whther this video already exists. This is called when creating a new video, to save the
      # user from wasting time entering details about an existing video.
      # eg: http://localhost:3000/videos.json?uid=AlkKPojdVAk
      @videos = Video.where(:uid => params[:uid]).paginate(:page => params[:page], :per_page => 16)

    else
      # Show videos in random order. Code is from http://nomethoderror.com/blog/2014/02/05/activerecord-random-ordering-with-pagination/
      seed_val = Video.connection.quote(cookies[:rand_seed])
      Video.connection.execute("select setseed(#{seed_val})")
      @videos = Video.order('random()').paginate(:page => params[:page], :per_page => 16)
    end

    @tags = Tag.where(major: true).order(:name)

    # Respond as JSON, so that this function can be called via AJAX to determine whether a video
    # already exists when creating a new video via http://localhost:3000/videos/new
    respond_to do |format|
      format.html
      format.json { render json: @videos }  # respond with the created JSON object
    end

  end

  def new
    @video = current_user.videos.build
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
    @video = current_user.videos.build(video_params)
    if @video.save
        flash[:notice] = "video #{@video.title} added successfully."
        begin
          # Email the admins to let them know a new video has been added
          User.where(role: Role.where(name: "admin")).each do |user|
            NotifyMailer.new_video_email(user, @video).deliver_now
          end
        rescue
          puts "There was a problem emailing the admins about this video"
        end
        redirect_to admin_path
      else
        flash[:notice] = @video.errors.full_messages.to_sentence
        render 'new', layout: 'no_footer'
      end    
  end

  def update
    if @video.update(video_params)
      if current_user.curator?
        redirect_to admin_path
      else
        redirect_to @video
      end
    else
      render 'edit'
    end
  end


  def destroy
    @video.destroy
    flash[:notice] = "Video #{@video.title} deleted successfully."
    redirect_to admin_path
  end

private

  def video_params
    params.require(:video).permit(:title, :description, :url, :event_id, :status, :speaker_name, :speaker_url, :uid, :featured, :R18, :new_tag_name, :new_playlist_name,playlist_ids: [], tag_ids: [])
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

end
