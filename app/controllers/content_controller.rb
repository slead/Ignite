class ContentController < ApplicationController
  layout 'no_footer', :only => [:start]
  
  def show
    render content_params[:content]
  end

  def home
    @first_video = Video.where(status: 'published').where(featured: true).last
    @videos = Video.where(status: 'published').where(featured: true).where.not(id: @first_video.id).limit(12).order("RANDOM()")
    @upcomings = Upcoming.where(status:'published').where('date > ?', Date.yesterday).limit(12).order('date ASC')
    @tags = Tag.where(major: true).order(:name)
  end

  def content_params
    params.permit :content
  end
end