class UpcomingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource except: [:index, :show]
  before_action :find_upcoming, only: [:show, :edit, :update, :destroy]
  layout 'no_footer', :only => [:new, :edit]
  
  # rescue_from ActiveRecord::RecordNotFound do
  #   flash[:notice] = "Sorry, that upcoming event does not exist"
  #   redirect_to action: :index
  # end

  def index
    @upcomings = Upcoming.all.order('date ASC')
    respond_to do |format|
      format.html
      # Format the response for the DataTables plugin on the Admin page
      format.json { render json: UpcomingDatatable.new(view_context, { user: current_user, role: current_user.role }) }
    end  
  end

  def show
  end

  def new
    # If this user can only manage one event, just assign the upcoming to that event
    if current_user.events.count == 1
      @upcoming = Upcoming.new(event: current_user.events.first)
    else
      @upcoming = Upcoming.new
    end
  end

  def edit
  end

  def create
    # @upcoming = current_user.upcomings.build(upcoming_params)
    @upcoming = Upcoming.create(upcoming_params)
    if @upcoming.save
      flash[:notice] = "Upcoming event #{@upcoming.name} added successfully."
      redirect_to admin_path
    else
      flash.now[:notice] = @upcoming.errors.full_messages.to_sentence
      render 'new', layout: 'no_footer'
    end
  end

  def update
    if @upcoming.update(upcoming_params)
      redirect_to @upcoming
    else
      render 'edit'
    end
  end

  def destroy
    @upcoming.destroy
    flash[:notice] = "Upcoming event #{@upcoming.name} deleted successfully."
    redirect_to admin_path
  end

  private

  def upcoming_params
    params.require(:upcoming).permit(:name, :event_id, :date, :status)
  end

  def find_upcoming
    @upcoming = Upcoming.find(params[:id])
  end
end
