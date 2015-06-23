class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    @videos = Video.where(status: 'published')
    @draft_videos = Video.where(status: 'draft')
    @rejected_videos = Video.where(status: 'rejected')
    @events = Event.where(status: 'published')
    @draft_events = Event.where(status: 'draft')
    @rejected_events = Event.where(status: 'rejected')
    @upcomings = Upcoming.all
  end

end
