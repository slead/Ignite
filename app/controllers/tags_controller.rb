class TagsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource :find_by => :slug, except: [:index, :show]
  before_action :find_tag, only: [:show, :edit, :update, :destroy, :update_stats]
  layout 'no_footer', :only => [:new, :edit]

  def index
    if params[:name].present?
      # Check whether this tag already exists
      # eg: http://localhost:3000/tags.json?name=technology
      @tags = Tag.where(:name => params[:name]).paginate(:page => params[:page], :per_page => 9)
    else
      @tags = Tag.where("video_count > 0").paginate(:page => params[:page], :per_page => 9)
    end

    # Respond as JSON, so that this function can be called via AJAX to determine whether a video
    # already exists when creating a new video via http://localhost:3000/videos/new
    respond_to do |format|
      format.html
      if params["draw"].present?
        # Format the response for the DataTables plugin on the Admin page
        format.json { render json: TagDatatable.new(view_context, { user: current_user, role: current_user.role }) }
      else
        format.json { render json: @tags }
      end
    end

  end

  def new
    # @tag = current_user.tags.build
    @tag = Tag.new
  end

  def show
    @videos = @tag.videos.order(:title).paginate(:page => params[:page], :per_page => 16)
  end

  def edit
  end

  def create
    # @tag = current_user.tags.build(tag_params)
    @tag = Tag.create(tag_params)
    @tag.user = current_user
    if @tag.save
        flash[:notice] = "tag #{@tag.name} added successfully."
        redirect_to admin_path
      else
        flash[:notice] = @tag.errors.full_messages.to_sentence
        render 'new', layout: 'no_footer'
      end    
  end

  def update
    if @tag.update(tag_params)
      if current_user.curator?
        redirect_to admin_path
      else
        redirect_to @tag
      end
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
    params.require(:tag).permit(:name, :user_id)
  end

    def find_tag
    @tag = Tag.friendly.find(params[:id])
  end

end
