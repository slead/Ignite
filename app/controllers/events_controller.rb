class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource :find_by => :slug, except: [:index, :show]
  before_action :find_event, only: [:show, :edit, :update, :destroy]
  layout 'no_footer', :only => [:new, :edit]
  
  # rescue_from ActiveRecord::RecordNotFound do
  #   flash[:notice] = "Sorry, that event does not exist"
  #   redirect_to action: :index
  # end

  def index
    @geojson = Array.new #TODO - hardcode the IgniteTalks event to the JSON so it's always shown
    if params[:zoom].present? and params[:zoom].to_i < 3
      @events = Event.order(:name)
    elsif params[:bbox].present?
      #Find events which fall within the current map extent
      bbox = params[:bbox].split(",").map(&:to_f)
      @events = Event.within_bounding_box(bbox).order(:name)
    elsif params[:name].present?
      # Check whther this event already exists. This is called when creating a new video, to save the
      # user from wasting time entering details about an existing video.
      # eg: http://localhost:3000/events.json?name=ignite+sydney
      @events = Event.where(:name => params[:name])
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
    @playlists = @event.playlists.where("video_count > 0")
    if @playlists.exists?
      # Don't show the same videos in a playlist and in the non-playlist section
      @videos = @event.videos
      @playlists.each do |playlist|
        @videos -= playlist.videos
      end
      @videos = @videos.paginate(:page => params[:page], :per_page => 16)
    else
      @videos = @event.videos.paginate(:page => params[:page], :per_page => 16)
    end
    @upcomings = @event.upcomings.where('date > ?', Date.yesterday)
    @og_title = @event.name + ' on IgniteTalks.io'
  end

  def new
    @event = current_user.events.build
  end

  def edit
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
        flash[:notice] = "Event #{@event.name} added successfully."
        redirect_to admin_path
      else
        flash[:notice] = @event.errors.full_messages.to_sentence
        render 'new', layout: 'no_footer'
      end    
  end

  def update
    if @event.update(event_params)
      redirect_to admin_path
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = "Event #{@event.name} deleted successfully."
    redirect_to admin_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :city, :country, :url, :status, :twitter_name)
  end

  def find_event
    @event = Event.friendly.find(params[:id])
  end
end
