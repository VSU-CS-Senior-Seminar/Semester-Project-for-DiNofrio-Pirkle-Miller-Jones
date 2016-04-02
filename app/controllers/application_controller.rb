class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    # registration_params = []
    devise_parameter_sanitizer.for(:sign_up) << [:name, :zipcode]
    devise_parameter_sanitizer.for(:sign_in) << [:name, :zipcode]
  end
  
  private
  def user_not_authorized
    flash[:alert] = "Access denied!"
    redirect_to (request.referrer || root_path)
  end
end
