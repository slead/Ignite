class AdminController < ApplicationController
  layout 'no_footer'
  before_action :authenticate_user!

  def index
  end

end
