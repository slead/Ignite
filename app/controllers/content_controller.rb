class ContentController < ApplicationController
  before_action :authenticate_user!, :except => "start"
  layout 'no_footer', :only => [:start]
  
  def show
    render content_params[:content]
  end

  def home
    begin
      @first_video = Video.where(featured: true).last
      @videos = Video.where(featured: true).where.not(id: @first_video.id).limit(12).order("RANDOM()")
    rescue
      puts "need to add some videos"
      @first_video = nil
      @videos = []
    end
    @upcomings = Upcoming.where('date > ?', Date.yesterday).limit(12).order('date ASC')
    @tags = Tag.where(major: true).order(:name)
    @playlists = Playlist.where(featured: true)
  end

  def content_params
    params.permit :content
  end
end