class ContentController < ApplicationController
  def show
    render content_params[:content]
  end

  def home
    @videos = Video.all.order(:created_at)
  end

  def content_params
    params.permit :content
  end
end