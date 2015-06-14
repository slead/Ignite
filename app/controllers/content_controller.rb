class ContentController < ApplicationController
  def show
    render content_params[:content]
  end

  def home
    @first_video = Video.first
    @videos = Video.all.offset(1).limit(10).order(:created_at)
    @upcomings = Upcoming.all.limit(10).order('date DESC')
  end

  def content_params
    params.permit :content
  end
end