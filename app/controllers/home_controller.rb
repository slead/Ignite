class HomeController < ApplicationController

  def index
    @events = Event.all.order(:name)
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
