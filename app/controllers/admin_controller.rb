class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    @videos = Video.all
    @events = Event.all
    @tags = Tag.all
    @users = User.all
  end

end
