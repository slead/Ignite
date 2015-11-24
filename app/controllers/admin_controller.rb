class AdminController < ApplicationController
  layout 'no_footer'
  before_action :authenticate_user!

  def index
    # Playlists are required in the Import From YouTube Playlist functionality
    if ['admin', 'curator'].include? current_user.role.name
      @playlists = Playlist.all
    else
      @playlists = current_user.playlists
    end
  end

end
