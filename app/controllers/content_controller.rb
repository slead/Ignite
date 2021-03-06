class ContentController < ApplicationController
  # before_action :authenticate_user!, :except => "start"
  layout 'no_footer', :only => [:start, :stats]
  
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
    @upcomings = Upcoming.all.order('date DESC').limit(15)
    @tags = Tag.where(major: true).order(:name)
    @playlists = Playlist.where("featured and video_count > 0")

    respond_to :html

  end

  def stats
    @total_views = Video.all.sum("views")
    @total_likes = Video.all.sum("likes")
    @total_videos = Video.all.count
    @total_events = Event.all.count
  end

  def content_params
    params.permit :content
  end
end