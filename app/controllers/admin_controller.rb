class AdminController < ApplicationController
  layout 'no_footer'
  before_action :authenticate_user!

  def index
    if current_user.admin?
        @videos = Video.all
        @events = Event.all
        @upcomings = Upcoming.all
        @users = User.all
    else
        # Non-admin users can see the Ignites they've been given permission to see, and the Videos
        # which are owned by those Ignites. When creating a new Video, only the Ignites they have
        # permission to edit are listed as the venue

        @events = current_user.events
        @videos = []
        @upcomings = []
        @events.map do |event|
          event.videos.map do |video|
            @videos.push(video)
          end
          event.upcomings.map do |upcoming|
            @upcomings.push(upcoming)
          end
        end
    end
  end

end
