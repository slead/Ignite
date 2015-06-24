class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Open the Admin panel after the user signs in
  # def after_sign_in_path_for(resource)
  #   admin_path
  # end

  after_filter :store_location

  Yt.configure do |config|
    config.api_key = 'AIzaSyCPOAgGgCNBrHB1trDKtv6rdjWpzObqxLM'
  end

  private
    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_stored_location
      session[:return_to] = nil
    end

    def redirect_back_or_to(alternate)
      redirect_to(session[:return_to] || alternate)
      clear_stored_location
    end

end
