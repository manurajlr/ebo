class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, if: :devise_controller?

rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access Denied"
    redirect_to user_url(:id => current_user.id)
 end

def update_sanitized_params
  devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :middle_name,:last_name,:email,:login,:password,:password_confirmation,:employee_id,:date_of_birth,:gender,:time_zone,:designation_id,:date_of_joining,:is_locked,:is_active,:education,:comments,:date_of_deactivation,:reason_for_deactivation,:work_phone)}
end
#before_action :authenticate_user!
end
