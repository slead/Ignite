class AdminController < ApplicationController
  layout 'no_footer'
  before_action :authenticate_user!

  def index

    if current_user.admin?
        # Videos (published, draft and rejected)
        @videos = Video.where(status: 'published')
        @draft_videos = Video.where(status: 'draft')
        @rejected_videos = Video.where(status: 'rejected')

        # Ignites (published, draft and rejected)
        @ignites = Ignite.where(status: 'published')
        @draft_ignites = Ignite.where(status: 'draft')
        @rejected_ignites = Ignite.where(status: 'rejected')

        # Upcomings (published, draft and rejected)
        @upcomings = Upcoming.where(status: 'published')
        @draft_upcomings = Upcoming.where(status: 'draft')
        @rejected_upcomings = Upcoming.where(status: 'rejected')
    else
        # Non-admin users can see everything they've suggested
        @videos = current_user.videos
        @ignites = current_user.ignites
        @upcomings = current_user.upcomings
    end
  end

end
