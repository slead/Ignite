class UsersController < ApplicationController
  before_action :authenticate_user!
  before_filter :authorize_admin
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  layout 'no_footer'

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "User #{@user.email} deleted successfully."
    redirect_to users_path
  end

  def create
    # admins only
  end

  def show
  end

  private

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'User management is for site admins only. Please contact Carly for more information'
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :admin)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
