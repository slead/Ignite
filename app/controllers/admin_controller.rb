class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    @videos = Video.all
    @events = Event.all
    @upcomings = Upcoming.all
  end

end
