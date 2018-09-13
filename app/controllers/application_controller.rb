class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :is_admin?

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def is_admin?
    if current_user && current_user.admin
      return true
    else
      flash[:alert] = "You aren't authorized to visit that page"
      redirect_to '/signin'
    end
  end

end
