module VideosHelper

  def embed(youtube_id)
    # Generate the YouTube iframe embed code based on the YouTube ID
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}?hd=1&rel=0&autohide=0&showinfo=0")
  end

  def thumbnail(youtube_id)
    # Generate an image from the thumbnail, based on the YouTube ID. This assumes a HD video, which we don't currently check programatically.
    content_tag(:image, nil, src: "//img.youtube.com/vi/#{youtube_id}/maxresdefault.jpg")
  end
  
end
