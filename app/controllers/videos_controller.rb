class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_video, only: [:show, :edit, :update, :destroy, :update_stats]
  before_action :update_youtube_stats, only: [:show]

  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = 'Sorry, that video does not exist'
    redirect_to action: :index
  end
 
  def index

    if params[:query].present?
      puts params
      @videos = Video.search(params[:query], where:{status: 'published'}, page: params[:page], :per_page => 8)
    elsif params[:tag].present?
      @tag = Tag.find_by(name: params[:tag])
      @videos = @tag.videos.where(status: 'published').paginate(:page => params[:page], :per_page => 8)
    elsif params[:sort].present? and params[:sort] == 'likes' || params[:sort] == 'views'
      @videos = Video.where(status: 'published').order("#{params[:sort]} DESC").paginate(:page => params[:page], :per_page => 8)
    else
      @videos = Video.where(status: 'published').paginate(:page => params[:page], :per_page => 8)
    end
    @tags = Tag.where(major: true).order(:name)
  end

  def new
    @video = current_user.videos.build
  end

  def show
    #Show up to 4 videos which share the same tag. related_videos is calculated in the video.rb model
    @related_videos = @video.related_videos.pop(4)
  end

  def edit
  end

  def create
    @video = current_user.videos.build(video_params)
    if current_user.admin?
      # If the current user is an administrator, create the video normally. It's immediately published.
      @video.status = 'published'
    else
      # If this user is not an admin, flag the video as a draft. It won't show on public pages until published
      @video.status = 'draft'
    end

    if @video.save
        flash[:notice] = "video #{@video.title} added successfully."
        redirect_to admin_path
      else
        flash[:notice] = @video.errors.full_messages.to_sentence
        render 'new'
      end    
  end

  def update
    if @video.update(video_params)
      redirect_to admin_path
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
    params.require(:video).permit(:title, :description, :url, :event_id, :status, :speaker_name, :speaker_url, :uid, tag_ids: [])
  end

  def find_video
    @video = Video.friendly.find(params[:id])
  end

  def update_youtube_stats
    #Update the view, like and dislike counts
    unless @video.uid.nil?
      video = Yt::Video.new id: @video.uid
      @video.views = video.view_count
      @video.likes = video.like_count
      @video.dislikes = video.dislike_count
      @video.save
    end
  end

end
