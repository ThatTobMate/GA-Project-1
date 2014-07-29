class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_ransack_form_variables

 rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_path, alert: "You can't access this page"
end

  def set_ransack_form_variables
    @q = Song.search(params[:q])
    @songs = @q.result(distinct: true)
  end

  helper_method :current_user
  # before_filter :can_access_route

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    unless current_user
      redirect_to root_path, alert: "You need to be logged in to access this site"
    end
  end
end
