class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_video, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = 'Sorry, that video does not exist'
    redirect_to action: :index
  end
 
  def index
    if params[:tag].blank?
      @videos = Video.all
    else
      @tag = Tag.find_by(name: params[:tag])
      @videos = @tag.videos
    end
    @tags = Tag.all
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
    if @video.save
      flash[:notice] = "video #{@video.title} added successfully."
      redirect_to @video
    else
      flash.now[:error] = @video.errors.map(&:full_messages)
      render 'new'
    end
  end

  def update
    if @video.update(video_params)
      redirect_to @video
    else
      render 'edit'
    end
  end


  def destroy
    @video.destroy
    flash[:notice] = "Video #{@video.title} deleted successfully."
    redirect_to root_path
  end

private

  def video_params
    params.require(:video).permit(:title, :description, :url, :event_id, tag_ids: [])
  end

  def find_video
    @video = Video.friendly.find(params[:id])
  end

end
