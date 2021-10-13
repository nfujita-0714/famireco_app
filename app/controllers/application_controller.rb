class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    pictures_path
  end
  
  def after_update_path_for(resource)
    pictures_path
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :self_introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :self_introduction])
  end
end
