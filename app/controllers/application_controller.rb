class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def current_user
    @_current_user ||= session[:current_user_id] &&
    User.find_by(id: session[:current_user_id])
  end
end
