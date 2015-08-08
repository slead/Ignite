class ContentController < ApplicationController
  
  def show
    render content_params[:content]
  end

  def home
    @first_video = Video.where(status: 'published').last
    @videos = Video.where(status: 'published').offset(1).limit(12).order('created_at DESC')
    @upcomings = Upcoming.where(status:'published').where('date > ?', Date.yesterday).limit(12).order('date ASC')
    @tags = Tag.where(major: true).order(:name)
  end

  def content_params
    params.permit :content
  end
end