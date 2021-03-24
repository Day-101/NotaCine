class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def redirect_if_not_admin
		redirect_to root_path flash.alert="You need to be admin to do that !" unless current_user.rank == 0
	end
  
end
