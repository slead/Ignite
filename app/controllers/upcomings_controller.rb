class UpcomingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_upcoming, only: [:show, :edit, :update, :destroy]
  layout 'no_footer', :only => [:new, :edit]
  
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
    if current_user.admin?
      # If the current user is an administrator, create the upcoming event normally. It's immediately published.
      @upcoming.status = 'published'
    else
      # If this user is not an admin, flag the upcoming event as a draft. It won't show on public pages until published
      @upcoming.status = 'draft'
    end

    if @upcoming.save
      flash[:notice] = "Upcoming event #{@upcoming.name} added successfully."
      if @upcoming.status == 'draft'
        NotifyMailer.new_draft_email(User.first).deliver # Notify an admin via email
      end
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
