# app/controllers/sitemap_controller.rb

class SitemapController < ApplicationController
  layout nil
  def index
    headers['Content-Type'] = 'application/xml'
    respond_to do |format|
      format.xml {@videos = Video.all}
    end
  end
end
