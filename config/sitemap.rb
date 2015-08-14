# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.ignitetalks.io"

SitemapGenerator::Sitemap.create do
  add '/contact'
  add '/start'
  add '/videos'
  add '/ignites'
  Video.find_each do |video|
    add video_path(video), :lastmod => video.updated_at
  end
  Ignite.find_each do |ignite|
    add ignite_path(ignite), :lastmod => ignite.updated_at
  end
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
