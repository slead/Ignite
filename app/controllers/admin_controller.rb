class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    @videos = Video.all
    @events = Event.all
  end

end
