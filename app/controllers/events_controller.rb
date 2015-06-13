class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_event, only: [:show, :edit, :update, :destroy]
  
  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = "Sorry, that event does not exist"
    redirect_to action: :index
  end

  def index
    @events = Event.all.order(:name)
  end

  def show
    @videos = @event.videos
  end

  def new
    @event = current_user.events.build
  end

  def edit
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:notice] = "event #{@event.name} added successfully."
      redirect_to @event
    else
      errors = []
      @event.errors.full_messages.each do |msg|
        errors << msg
      end
      flash.now[:notice] = errors
      render 'new'
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = "event #{@event.name} deleted successfully."
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :city, :country, :url)
  end

  def find_event
    @event = Event.friendly.find(params[:id])
  end
end
