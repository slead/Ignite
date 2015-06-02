class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_event, only: [:show, :edit, :update, :destroy]
  
  def index
    @events = Event.all
  end

  def show
    @videos = @event.videos

  end

  def edit
  end

  def create
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :address, :url)
  end

  def find_event
    #@event = Event.find(params[:id])
    @event = Event.friendly.find(params[:id])
  end
end
