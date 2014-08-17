class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  #before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :remember_me) }
  end
  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:account_update) << :username
     devise_parameter_sanitizer.for(:account_update) << :bio
     devise_parameter_sanitizer.for(:account_update) << :location
       
  end
  
end
