class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user

  def set_user
    @user = current_user
  end

  def default_url_options
  { host: ENV["HOST"] || "localhost:3000" }
  end

  private

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # only if you want the user to bae able to update his username
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

end
