module VideosHelper
  def embed(youtube_url)
    # Generate the YouTube iframe embed code based on the YouTube URL
    youtube_id = youtube_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}?hd=1&rel=0&autohide=0&showinfo=0")
  end

  def thumbnail(youtube_url)
    # Generate an image from the thumbnail, based on the YouTube URL
    youtube_id = youtube_url.split("=").last
    content_tag(:image, nil, src: "//img.youtube.com/vi/#{youtube_id}/0.jpg")
  end
end
