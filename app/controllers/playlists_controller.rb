class PlaylistsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource :find_by => :slug, except: [:index, :show]
  before_action :find_playlist, only: [:show, :edit, :update, :destroy, :update_stats]
  before_action :find_users_videos, only: [:new, :edit, :update]
  layout 'no_footer', :only => [:new, :edit]

  def index
    if params[:name].present?
      # Check whether this playlist already exists. This is called when creating a new video
      # eg: http://localhost:3000/playlists.json?name=playlist_name
      @playlists = Playlist.where(:name => params[:name]).paginate(:page => params[:page], :per_page => 9)
    else
      # Only playlists flagged as Listed appear on the Playlists Index page
      @playlists = Playlist.where("listed and video_count > 0").paginate(:page => params[:page], :per_page => 9)
    end

    # Respond as JSON, so that this function can be called via AJAX to determine whether a video
    # already exists when creating a new video via http://localhost:3000/videos/new
    respond_to do |format|
      format.html
      if params["draw"].present?
        # Format the response for the DataTables plugin on the Admin page
        format.json { render json: PlaylistDatatable.new(view_context, { user: current_user, role: current_user.role }) }
      else
        format.json { render json: @playlists }
      end
    end

  end

  def new
    @playlist = Playlist.new
  end

  def show
    @videos = @playlist.videos.where("status = 'published'").paginate(:page => params[:page], :per_page => 16)
  end

  def edit
  end

  def create
    @playlist = Playlist.create(playlist_params)
    @playlist.user = current_user
    if @playlist.save
        flash[:notice] = "playlist #{@playlist.name} added successfully."
        redirect_to admin_path
      else
        flash[:notice] = @playlist.errors.full_messages.to_sentence
        render 'new', layout: 'no_footer'
      end    
  end

  def update
    if @playlist.update(playlist_params)
      if current_user.curator?
        redirect_to admin_path
      else
        redirect_to @playlist
      end
    else
      render 'edit'
    end
  end


  def destroy
    @playlist.destroy
    flash[:notice] = "Video #{@playlist.name} deleted successfully."
    redirect_to admin_path
  end

private

  def playlist_params
    params.require(:playlist).permit(:name, :event_id, :user_id, :description, :featured, :listed, video_ids: [])
  end

  def find_playlist
    @playlist = Playlist.friendly.find(params[:id])
  end

  def find_users_videos
    # Determine which videos this user has access to add to playlists
    if current_user.curator?
        @videos = Video.all
    else
        # Non-admin users can see the Ignites they've been given permission to see, and the Videos
        # which are owned by those Ignites

        @events = current_user.events
        @videos = []
        events.each do |event|
          @videos += event.videos
        end
    end
  end

end
