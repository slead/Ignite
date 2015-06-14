class ContentController < ApplicationController
  def show
    render content_params[:content]
  end

  def home
    @first_video = Video.first
    @videos = Video.all.offset(1).limit(8).order(:created_at)
    @upcomings = Upcoming.all.limit(12).order('date ASC')
  end

  def content_params
    params.permit :content
  end
end