class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameters, if: :devise_controller?

  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:profile,:profile_image])
    devise_parameter_sanitizer.permit(:edit, keys: [:name,:profile,:profile_image])
    devise_parameter_sanitizer.permit(:update, keys: [:name,:profile,:profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:profile,:profile_image])

  end
end
