class AdminController < ApplicationController
  before_action :authenticate_user!

  def index

    # Videos (published, draft and rejected)
    @videos = Video.where(status: 'published')
    @draft_videos = Video.where(status: 'draft')
    @rejected_videos = Video.where(status: 'rejected')

    # Events (published, draft and rejected)
    @events = Event.where(status: 'published')
    @draft_events = Event.where(status: 'draft')
    @rejected_events = Event.where(status: 'rejected')

    # Upcomings (published, draft and rejected)
    @upcomings = Upcoming.where(status: 'published')
    @draft_upcomings = Upcoming.where(status: 'draft')
    @rejected_upcomings = Upcoming.where(status: 'rejected')

  end

end
