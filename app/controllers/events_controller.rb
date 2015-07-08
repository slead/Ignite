class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_event, only: [:show, :edit, :update, :destroy]
  layout 'no_footer', :only => [:new, :edit]
  
  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = "Sorry, that event does not exist"
    redirect_to action: :index
  end

  def index
    @geojson = Array.new
    if params[:zoom].present? and params[:zoom].to_i < 3
      @events = Event.where(status: 'published').order(:name)
    elsif params[:bbox].present?
      #Find events which fall within the current map extent
      bbox = params[:bbox].split(",").map(&:to_f)
      @events = Event.where(status: 'published').within_bounding_box(bbox).order(:name)
    else
      @events = Event.where(status: 'published').all.order(:name)  
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
    @og_title = @event.name + ' on IgniteTalks.io'
  end

  def new
    @event = current_user.events.build
  end

  def edit
  end

  def create
    @event = current_user.events.build(event_params)
    if current_user.admin?
      # If the current user is an administrator, create the event normally. It's immediately published.
      @event.status = 'published'
    else
      # If this user is not an admin, flag the event as a draft. It won't show on public pages until published
      @event.status = 'draft'
    end

    if @event.save
        flash[:notice] = "Event #{@event.name} added successfully."
        if @event.status == 'draft'
          NotifyMailer.new_draft_email(User.first).deliver # Notify an admin via email
        end
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
