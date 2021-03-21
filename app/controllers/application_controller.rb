class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_user_exist?
  helper_method :logged_in?

  def current_user
    User.find_by(id: session[:current_user_id])
  end

  def current_user_exist?
    if current_user.nil?
      redirect_to session_new_path
    end

  end

  def logged_in?
    session[:logged_in]
  end
  
end
