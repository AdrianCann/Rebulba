class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?

  def current_user
    @current_user || User.find_by(token: session[:token])
  end

  def logged_in?
    !!current_user
  end

  def login(user)
    @current_user = user
    session[:token] = user.reset_token!
  end

  def logout
    @current_user = nil
    session[:token] = nil
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

end
