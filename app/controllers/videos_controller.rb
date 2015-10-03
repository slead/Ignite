class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource
  before_action :find_video, only: [:show, :edit, :update, :destroy, :update_stats]
  before_action :update_youtube_stats, only: [:show]
  layout 'no_footer', :only => [:new, :edit]

  # rescue_from ActiveRecord::RecordNotFound do
  #   flash[:notice] = 'Sorry, that video does not exist'
  #   redirect_to action: :index
  # end
 
  def index

    if params[:query].present?
      @videos = Video.search(params[:query], page: params[:page], :per_page => 9)
    elsif params[:tag].present?
      @tag = Tag.find_by(name: params[:tag])
      @videos = @tag.videos.paginate(:page => params[:page], :per_page => 9)
    elsif params[:sort].present? and params[:sort] == 'likes' || params[:sort] == 'views'
      @videos = Video.order("#{params[:sort]} DESC").paginate(:page => params[:page], :per_page => 9)
    else
      @videos = Video.paginate(:page => params[:page], :per_page => 9)
    end
    @tags = Tag.where(major: true).order(:name)
  end

  def new
    @video = current_user.videos.build
  end

  def show
    #Show up to 4 videos which share the same tag. related_videos is calculated in the video.rb model
    @related_videos = @video.related_videos.pop(4)

    #Customise the Facebook/Twitter sharing content
    @og_title = "IgniteTalks.io" + " | " + @video.title + " by " + @video.speaker_name
    if @video.description.blank?
      @og_description = @video.speaker_name + " speaks at " + @video.event.name
    else
      @og_description = @video.description
    end
    @og_image = "http://img.youtube.com/vi/#{@video.uid}/maxresdefault.jpg"
  end

  def edit
  end

  def create
    @video = current_user.videos.build(video_params)
    if @video.save
        flash[:notice] = "video #{@video.title} added successfully."
        redirect_to admin_path
      else
        flash[:notice] = @video.errors.full_messages.to_sentence
        render 'new', layout: 'no_footer'
      end    
  end

  def update
    if @video.update(video_params)
      if current_user.admin?
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
    params.require(:video).permit(:title, :description, :url, :event_id, :status, :speaker_name, :speaker_url, :uid, :featured, tag_ids: [])
  end

  def find_video
    @video = Video.friendly.find(params[:id])
  end

  def update_youtube_stats
    #Update the view, like and dislike counts
    unless @video.uid.nil?
      begin
        video = Yt::Video.new id: @video.uid
        @video.views = video.view_count
        @video.likes = video.like_count
        @video.dislikes = video.dislike_count
        @video.save
      rescue Exception => e
        print "YouTube API error"
      end
    end
  end

end
