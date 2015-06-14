class UpcomingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_upcoming, only: [:show, :edit, :update, :destroy]
  
  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = "Sorry, that upcoming event does not exist"
    redirect_to action: :index
  end

  def index
    @upcomings = Upcoming.all.order('date ASC')
  end

  def show
  end

  def new
    @upcoming = current_user.upcomings.build
  end

  def edit
  end

  def create
    @upcoming = current_user.upcomings.build(upcoming_params)
    if @upcoming.save
      flash[:notice] = "Upcoming event #{@upcoming.name} added successfully."
      redirect_to @upcoming
    else
      errors = []
      @upcoming.errors.full_messages.each do |msg|
        errors << msg
      end
      flash.now[:notice] = errors
      render 'new'
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
    redirect_to root_path
  end

  private

  def upcoming_params
    params.require(:upcoming).permit(:name, :event_id, :date)
  end

  def find_upcoming
    @upcoming = Upcoming.find(params[:id])
  end
end
