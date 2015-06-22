class VideosController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :autocomplete] #:show,
  before_action :find_video, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = 'Sorry, that video does not exist'
    redirect_to action: :index
  end
 
  def index

    if params[:query].present?
      @videos = Video.where(status: 'published').search(params[:query], page: params[:page], :per_page => 8)
    elsif params[:tag].present?
      @tag = Tag.find_by(name: params[:tag])
      @videos = @tag.videos.paginate(:page => params[:page], :per_page => 8)
    else
      @videos = Video.where(status: 'published').paginate(:page => params[:page], :per_page => 8)
    end
    @tags = Tag.where(major: true).order(:name)
  end

  def new
    if user_signed_in?
      @video = current_user.videos.build
    else
      @video = Video.new
    end
  end

  def show
    #Show up to 4 videos which share the same tag. related_videos is calculated in the video.rb model
    @related_videos = @video.related_videos.pop(4)
  end

  def edit
  end

  def create
    if user_signed_in?
      @video = current_user.videos.build(video_params)
      @video.status = 'published'
      if @video.save
        flash[:notice] = "video #{@video.title} added successfully."
        redirect_to admin_path
      else
        flash[:notice] = @video.errors.full_messages
        render 'new'
      end
    else
      @video = Video.create(video_params)
      @video.user_id = -9999
      @video.status = 'draft'
      if @video.save
        flash[:notice] = "Thanks for submitting a video. We'll check it out ASAP!"
        redirect_to root_path
      else
        flash[:notice] = @video.errors.full_messages
        render 'new'
      end
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
    params.require(:video).permit(:title, :description, :url, :event_id, :status, :speaker_name, :speaker_url, tag_ids: [])
  end

  def find_video
    @video = Video.friendly.find(params[:id])
  end

end
