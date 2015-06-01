class EventController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_event, only: [:show, :edit, :update, :destroy]
  
  def index
    @events = Event.all
  end

  def show
  end

  def edit
  end

  def create
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :city, :url)
  end

  def find_event
    @event = event.find(params[:id])
    # @event = event.friendly.find(params[:id])
  end

end
