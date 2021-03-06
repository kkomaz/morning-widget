class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def login(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  def oauth?
    !!current_user.token
  end
  helper_method :oauth?

  def authorized?
    logged_in? && current_user.id == params[:id].to_i
  end
  helper_method :authorized?

end
