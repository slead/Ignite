class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_event, only: [:show, :edit, :update, :destroy]
  
  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = "Sorry, that event does not exist"
    redirect_to action: :index
  end

  def index
    @geojson = Array.new
    if params[:zoom].present? and params[:zoom].to_i < 3
      @events = Event.all.order(:name)
    elsif params[:bbox].present?
      #Find events which fall within the current map extent
      bbox = params[:bbox].split(",").map(&:to_f)
      @events = Event.within_bounding_box(bbox).order(:name)
    else
      @events = Event.all.order(:name)  
    end
    # Make a JSON object from the events, to add to the map
    @geojson += @events.collect do |event|
      {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [event.longitude, event.latitude]
        },
        properties: {
          type: "event",
          id: event.id,
          name: event.name,
          city: event.city,
          country: event.country,
          url: event.slug
        }
      }
    end
    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end
  end

  def show
    @videos = @event.videos.where(status: 'published').paginate(:page => params[:page], :per_page => 8)
    @upcomings = @event.upcomings.where('date > ?', Date.yesterday)
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
      redirect_to admin_path
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
    redirect_to admin_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :city, :country, :url)
  end

  def find_event
    @event = Event.friendly.find(params[:id])
  end
end
