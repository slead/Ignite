class IgnitesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_ignite, only: [:show, :edit, :update, :destroy]
  
  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = "Sorry, that ignite does not exist"
    redirect_to action: :index
  end

  def index
    @ignites = Ignite.all.order(:name)
  end

  def show
    @videos = @ignite.videos
  end

  def new
    @ignite = current_user.ignites.build
  end

  def edit
  end

  def create
    @ignite = current_user.ignites.build(ignite_params)
    if @ignite.save
      flash[:notice] = "ignite #{@ignite.name} added successfully."
      redirect_to @ignite
    else
      errors = []
      @ignite.errors.full_messages.each do |msg|
        errors << msg
      end
      flash.now[:notice] = errors
      render 'new'
    end
  end

  def update
    if @ignite.update(ignite_params)
      redirect_to @ignite
    else
      render 'edit'
    end
  end

  def destroy
    @ignite.destroy
    flash[:notice] = "ignite #{@ignite.name} deleted successfully."
    redirect_to root_path
  end

  private

  def ignite_params
    params.require(:ignite).permit(:name, :city, :country, :url)
  end

  def find_ignite
    @ignite = Ignite.friendly.find(params[:id])
  end
end
