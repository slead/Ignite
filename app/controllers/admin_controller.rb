class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    @videos = Video.where(status: 'published')
    @draft_videos = Video.where(status: 'draft')
    @rejected_videos = Video.where(status: 'rejected')
    @events = Event.all
    @upcomings = Upcoming.all
  end

end
