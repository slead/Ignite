class AdminController < ApplicationController
  layout 'no_footer'
  before_action :authenticate_user!

  def index
    @tags = Tag.all.order(:name)
    if current_user.admin?
      # @videos = Video.all
      # @events = Event.all
      # @upcomings = Upcoming.all
      # @users = User.all
      # @playlists = Playlist.all
    elsif current_user.curator?
      # curators can see everything that an admin can see, except for Users
      # @videos = Video.all
      # @events = Event.all
      # @upcomings = Upcoming.all
      # @playlists = Playlist.all
    else
      # Non-admin users can see the Ignites they've been given permission to see, and the Videos
      # Playlists and Upcomings which are owned by those Ignites. When creating a new Video, only
      # the Ignites they have permission to edit are listed as the venue

      # @events = current_user.events
      # # @videos = []
      # @upcomings = []
      # # @playlists = []
      # @events.map do |event|
      #   # event.videos.map do |video|
      #   #   @videos.push(video)
      #   # end
      #   event.upcomings.map do |upcoming|
      #     @upcomings.push(upcoming)
      #   end
      #   # event.playlists.map do |playlist|
      #   #   @playlists.push(playlist)
      #   # end
      # end
    end
  end

end
