module VideosHelper

  def embed(youtube_id)
    # Generate the YouTube iframe embed code based on the YouTube ID
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}?hd=1&rel=0&autohide=0&showinfo=0")
  end

  # def thumbnail(youtube_id)
  #   # Generate an image from the thumbnail, based on the YouTube ID. This assumes a HD video, which we don't currently check programatically.
  #   content_tag(:image, nil, src: "//img.youtube.com/vi/#{youtube_id}/maxresdefault.jpg", class: "thumb")
  # end

  def thumbnail(video, rating_class)
    content_tag(:span, nil, :class => 'outer') do
      content_tag(:image, nil, src: "//img.youtube.com/vi/#{video.uid}/maxresdefault.jpg", class: "thumb") do
        content_tag(:span, nil, :class => rating_class) do
          content_tag(:i, nil, :class => "fa fa-youtube-play right-5") +
          content_tag(:span, "#{number_with_delimiter(video.views, :delimiter => ',')}", :class => "right-5") + 
          content_tag(:i, nil, :class => "fa fa-thumbs-up right-5") +
          content_tag(:span, "#{number_with_delimiter(video.likes, :delimiter => ',')}", :class => "right-5") +
          content_tag(:i, nil, :class => "fa fa-thumbs-down right-5") +
          content_tag(:span, "#{number_with_delimiter(video.dislikes, :delimiter => ',')}") 
        end
      end
    end
  end
  
end
