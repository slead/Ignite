module VideosHelper

  def embed(youtube_id)
    # Generate the YouTube iframe embed code based on the YouTube ID
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}?hd=1&rel=0&autohide=0&showinfo=0")
  end

  def thumbnail(video, rating_class)
    # Generate a thumbnail image containing viewing stats, which links to the video
    render 'videos/thumbnail', :video => video, :rating_class => rating_class
  end
end