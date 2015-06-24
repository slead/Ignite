module VideosHelper

  def embed(youtube_url)
    # Generate the YouTube iframe embed code based on the YouTube URL
    youtube_id = get_youtube_id(youtube_url)
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}?hd=1&rel=0&autohide=0&showinfo=0")
  end

  def thumbnail(youtube_url)
    # Generate an image from the thumbnail, based on the YouTube URL. This assumes a HD video, which we don't currently check programatically.
    youtube_id = get_youtube_id(youtube_url)
    content_tag(:image, nil, src: "//img.youtube.com/vi/#{youtube_id}/maxresdefault.jpg")
  end

  def get_youtube_id(youtube_url)
    # Get the index of the ?v or &v
    startIdx = youtube_url.index("?v")
    if startIdx.nil?
      startIdx = youtube_url.index("&v")
    end
    startIdx += 3

    # Get the index of the next & (or to the end of the URL if & is not present)
    endIdx = youtube_url.index("&", startIdx)
    unless endIdx.nil?
      endIdx -= 1
    else
      endIdx = youtube_url.length
    end

    # Return just the ID component, which is between those indices
    youtube_url[startIdx..endIdx]
  end
  
end
