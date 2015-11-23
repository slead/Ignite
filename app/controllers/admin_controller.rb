class AdminController < ApplicationController
  layout 'no_footer'
  before_action :authenticate_user!

  def index
    @playlists = Playlist.all
  end

end
