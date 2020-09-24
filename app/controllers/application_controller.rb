class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user?, :current_admin?, :current_search

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?
    current_user && current_user.user?
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def current_search
    Search.new(session[:search_critera]) if session[:search_critera]
  end
end
