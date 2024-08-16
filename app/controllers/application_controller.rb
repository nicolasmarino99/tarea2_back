# frozen_string_literal: true

# ApplicationController description
class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar username])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar username])
  end
end
