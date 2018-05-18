class UsersController < ApplicationController
  layout 'no_footer'
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_to do |format|
      format.html
      if params["draw"].present?
        # Format the response for the DataTables plugin on the Admin page
        format.json { render json: UserDatatable.new(view_context, { user: current_user, role: current_user.role }) }
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @joined_on = @user.created_at.to_formatted_s(:short)
    if @user.current_sign_in_at
      @last_login = @user.current_sign_in_at.to_formatted_s(:short)
    else
      @last_login = "never"
    end
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user.password = Devise.friendly_token.first(8)
    if @user.save
      # begin
        # Email the user to let them know their account has been created
      NotifyMailer.new_user_email(@user).deliver_now
      # rescue
      #   puts "There was a problem emailing the new user"
      # end
      respond_to do |format|
        format.html {
          flash[:notice] = "New user added successfully."
          redirect_to admin_path
        }
      end

    else
      respond_to do |format|
        format.html {
          flash[:notice] = @video.errors.full_messages.to_sentence
          render 'new', layout: 'no_footer'
        }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end

    respond_to do |format|
      if successfully_updated
        format.html { redirect_to admin_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def needs_password?(user, params)
      params[:password].present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :role_id, event_ids: [])
    end
end
