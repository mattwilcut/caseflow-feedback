class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :setup_fakes

  def unauthorized
    render status: 403
  end

  private

  def setup_fakes
    return unless Rails.env.development? || Rails.env.test? || Rails.env.demo?
    Fakes::Initializer.development!
  end

  def verify_authentication
    return true if current_user && current_user.authenticated?
    session["return_to"] = request.original_url
    redirect_to "/unauthorized"
  end

  def verify_authorized_roles(*roles)
    return true if current_user && roles.all? { |r| current_user.can?(r) }
    session["return_to"] = request.original_url
    redirect_to "/unauthorized"
  end

  def current_user
    @current_user ||= User.from_session(session)
  end
  helper_method :current_user

  def logo_class
    "cf-logo-image-default"
  end
  helper_method :logo_class
end
