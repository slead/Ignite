class TagsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = "Sorry, that tag does not exist"
    redirect_to action: :index
  end

  def index
    @tags = Tag.all.order('name ASC')
  end

  def show
  end

  def new
    @tag = Tag.new(params[:tag])
  end

  def edit
  end

  def create
    @tag = Tag.new(params[:tag]
    respond_to do |format|
      if @tag.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render json: root_path, status: :created, location: @tag }
      else
        format.html { render action: "new" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to @tag
    else
      render 'edit'
    end
  end

  def destroy
    @tag.destroy
    flash[:notice] = "Tag #{@tag.name} deleted successfully."
    redirect_to admin_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :status)
  end

  def find_tag
    @tag = Tag.find(params[:id])
  end
end
