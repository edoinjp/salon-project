# Define ApplicationController which is the base controller for your Rails application.
class ApplicationController < ActionController::Base
  # This before_action will call the configure_permitted_parameters method before any action in a Devise controller.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Define a method to configure permitted parameters for Devise controllers.
  def configure_permitted_parameters
    # Use the devise_parameter_sanitizer to permit the 'user_name' parameter during sign-up.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end
end
