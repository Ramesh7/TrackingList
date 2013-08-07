class ApplicationController < ActionController::Base
  
  helper_method :current_user, :is_user_logged_in?, :is_admin_logged_in?
  before_filter :login_required, :expire_session
  
  protect_from_forgery

  def login_required
  	redirect_to root_path unless is_user_logged_in?
  end

  def is_user_logged_in?
  	session[:user_id] ? true : false
  end

  def is_admin_logged_in?
  	session[:user_id] && session[:user_type].eql?('0')
  end

  def logged_user
  	session[:email]
  end

  def current_user
      @current_user ||= ::User.get_user(logged_user).first
  end

  def set_session(current_user)
    session[:user_id] = current_user.user_id
    session[:user_type] = current_user.user_type
    session[:email] = current_user.email
    session[:last_seen] = Time.now
  end

  def expire_session 
    if session[:last_seen] < 30.minutes.ago
      reset_session
      redirect_to root_path
    else
      session[:last_seen] = Time.now
    end
  end
end
