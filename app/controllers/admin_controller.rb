class AdminController < ApplicationController
  layout 'no_footer'
  before_action :authenticate_user!

  def index

    if current_user.admin?
        @videos = Video.all
        @events = Event.all
        @upcomings = Upcoming.all
    else
        # Non-admin users can see everything they've suggested
        @videos = current_user.videos
        @events = current_user.events
        @upcomings = current_user.upcomings
    end
  end

end
