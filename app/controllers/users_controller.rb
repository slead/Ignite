class UsersController < ApplicationController
  # Only site admins may control the users
  before_filter :verify_is_admin
  layout 'no_footer', :only => [:new, :edit]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
        flash[:notice] = "User #{@user.email} added successfully."
        redirect_to admin_path
      else
        flash[:notice] = @user.errors.full_messages.to_sentence
        render 'new', layout: 'no_footer'
      end    
  end

  def update
  end

  def show
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end

  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end


end
