module PlaylistsHelper
    def playlist_thumbnail(video, max_length)
    # Generate a simple thumbnail image, for use when generating playlists
    render 'playlists/thumbnail', :video => video, :max_length => max_length
  end
end
