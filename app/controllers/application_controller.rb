class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:find_location, :flight_search]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :job_title, :company, :host])
  end
end
