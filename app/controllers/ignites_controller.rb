class IgnitesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_ignite, only: [:show, :edit, :update, :destroy]
  layout 'no_footer', :only => [:new, :edit]
  
  # rescue_from ActiveRecord::RecordNotFound do
  #   flash[:notice] = "Sorry, that ignite does not exist"
  #   redirect_to action: :index
  # end

  def index
    @geojson = Array.new
    if params[:zoom].present? and params[:zoom].to_i < 3
      @ignites = Ignite.where(status: 'published').order(:name)
    elsif params[:bbox].present?
      #Find ignites which fall within the current map extent
      bbox = params[:bbox].split(",").map(&:to_f)
      @ignites = Ignite.where(status: 'published').within_bounding_box(bbox).order(:name)
    else
      @ignites = Ignite.where(status: 'published').all.order(:name)  
    end
    # Make a JSON object from the ignites, to add to the map
    @geojson += @ignites.collect do |ignite|
      {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [ignite.longitude, ignite.latitude]
        },
        properties: {
          type: "ignite",
          id: ignite.id,
          name: ignite.name,
          city: ignite.city,
          country: ignite.country,
          url: ignite.slug
        }
      }
    end
    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end
  end

  def show
    @videos = @ignite.videos.where(status: 'published').paginate(:page => params[:page], :per_page => 8)
    @upcomings = @ignite.upcomings.where('date > ?', Date.yesterday)
    @og_title = @ignite.name + ' on IgniteTalks.io'
  end

  def new
    @ignite = current_user.ignites.build
  end

  def edit
  end

  def create
    @ignite = current_user.ignites.build(ignite_params)
    if current_user.admin?
      # If the current user is an administrator, create the ignite normally. It's immediately published.
      @ignite.status = 'published'
    else
      # If this user is not an admin, flag the ignite as a draft. It won't show on public pages until published
      @ignite.status = 'draft'
    end

    if @ignite.save
        flash[:notice] = "Ignite #{@ignite.name} added successfully."
        if @ignite.status == 'draft'
          NotifyMailer.new_draft_email(User.first).deliver # Notify an admin via email
        end
        redirect_to admin_path
      else
        flash[:notice] = @ignite.errors.full_messages.to_sentence
        render 'new', layout: 'no_footer'
      end    
  end

  def update
    if @ignite.update(ignite_params)
      redirect_to admin_path
    else
      render 'edit'
    end
  end

  def destroy
    @ignite.destroy
    flash[:notice] = "Ignite #{@ignite.name} deleted successfully."
    redirect_to admin_path
  end

  private

  def ignite_params
    params.require(:ignite).permit(:name, :city, :country, :url, :status, :twitter_name)
  end

  def find_ignite
    @ignite = Ignite.friendly.find(params[:id])
  end
end
