class PlaylistsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource :find_by => :slug, except: [:index, :show]
  before_action :find_playlist, only: [:show, :edit, :update, :destroy, :update_stats]
  layout 'no_footer', :only => [:new, :edit]

  def index
    @playlists = Playlist.all.paginate(:page => params[:page], :per_page => 9)
  end

  def new
    @playlist = current_user.playlists.build
  end

  def show
    @videos = @playlist.videos
    

  end

  def edit
  end

  def create
    @playlist = current_user.playlists.build(playlist_params)
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
      if current_user.admin?
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
    params.require(:playlist).permit(:name, :event_id, :user_id, :feature, video_ids: [])
  end

  def find_playlist
    @playlist = Playlist.friendly.find(params[:id])
  end

end
