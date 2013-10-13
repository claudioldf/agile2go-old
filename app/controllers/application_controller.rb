class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :user_permitted_params, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  def user_permitted_params
    permit_sign_up
    permit_account_update
  end

  private

  def permit_sign_up
    devise_parameter_sanitizer.for(:sign_up) do |user|
      user.permit(:name, :email, :password, :password_confirmation)
    end
  end

  def permit_account_update
    devise_parameter_sanitizer.for(:account_update) do |user|
      user.permit(:name, :email, :password, :password_confirmation, :current_password)
    end
  end
end
