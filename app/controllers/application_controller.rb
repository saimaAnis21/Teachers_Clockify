class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_user_exist?
  helper_method :logged_in?
  helper_method :set_session_var

  def current_user
    User.find_by(id: session[:current_user_id])
  end

  def current_user_exist?
    redirect_to session_new_path if current_user.nil?
  end

  def logged_in?
    session[:logged_in]
  end

  def set_session_var(frmt)
    session[:current_user_id] = @user.id
    session[:current_user_name] = @user.name.to_s
    session[:logged_in] = true
    frmt.html { redirect_to user_path, notice: 'Successfully Logged in!!' }

  end

end
