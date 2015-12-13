class PlaylistsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource :find_by => :slug, except: [:index, :show, :update]
  before_action :find_playlist, only: [:show, :edit, :destroy, :update_stats]
  before_action :find_playlist_by_id, only: [:update]
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
    # If this user can only manage one event, just assign the playlist to that event
    if current_user.events.count == 1
      @playlist = Playlist.new(event: current_user.events.first)
    else
      @playlist = Playlist.new
    end
  end

  def show
    @videos = @playlist.videos.where("status = 'published'").paginate(:page => params[:page], :per_page => 16)
  end

  def edit
  end

  def create
    @playlist = Playlist.create(playlist_params)
    if @playlist.save
        flash[:notice] = "playlist #{@playlist.name} added successfully."
        redirect_to admin_path
      else
        flash[:notice] = @playlist.errors.full_messages.to_sentence
        render 'new', layout: 'no_footer'
      end    
  end

  def update
    # This method may be called via AJAX when adding an existing video to this playlist,
    # in the Import YouTube Playlist functionality. In that case, just add the video
    # to the playlist and save it, without making any other changes.
    if playlist_params[:video_ids]
      response = 0 # Return 0 if the video was already in the playlist
      begin
        videoId = playlist_params[:video_ids].first
        if not @playlist.videos.include? videoId
          @playlist.videos.append(Video.find_by(uid: videoId))
          response = 1 # Return 1 if the video was successfully added to the playlist
        end
      rescue
        response = 999 # Return an error flag
        puts "There was a problem adding this video to the playlist"
      end
      respond_to do |format|
        format.json {render json: response}
      end
    else
      # Otherwise, just update the playlist using the usual method.
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
  end


  def destroy
    @playlist.destroy
    flash[:notice] = "Video #{@playlist.name} deleted successfully."
    redirect_to admin_path
  end

private

  def playlist_params
    params.require(:playlist).permit(:name, :id, :event_id, :user_id, :description, :featured, :listed, video_ids: [])
  end

  def find_playlist
    @playlist = Playlist.friendly.find(params[:id])
  end

  def find_playlist_by_id
    @playlist = Playlist.find(params[:id])
  end

  def find_users_videos
    # Determine which videos this user can add to playlists
    if current_user.curator?
        videos = Video.all.order(:title) #.paginate(:page => params[:page], :per_page => 16)
    else
        # Non-admin users can see the Ignites they've been given permission to see, and the Videos
        # which are owned by those Ignites
        videos = current_user.videos.sort_by {|video| video.title} #.paginate(:page => params[:page], :per_page => 16)
    end
    # Remove any videos already in this playlist
    @videos = videos - @playlist.videos
  end

end
