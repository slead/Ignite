class User::Video::Finder
  # Returns a list of videos the given user can access
  def self.find(user)
    # Determine which videos this user has access to add to playlists
    if user.curator?
      Video.all
    else
      # Non-admin users can see the Ignites they've been given permission to see, and the Videos
      # which are owned by those Ignites
      videos = []
      user.events.each do |event|
        videos += event.videos
      end
      videos
    end
  end
end