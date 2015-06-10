class HomeController < ApplicationController

  def index
    @videos = Video.all.order(:created_at)
  end

  def show
  end

  def edit
  end

  def create
  end

  def destroy
  end
  
end
