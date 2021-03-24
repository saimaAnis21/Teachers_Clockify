class SessionController < ApplicationController
  def new; end

  def create
    @user = User.find_by(session_params)
    respond_to do |format|
      if !@user.nil?
        session_var(format)
      else
        format.html { redirect_to new_session_path, alert: 'Invalid name!' }
      end
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path
  end

  private

  def session_params
    params.require(:session).permit(:name)
  end
end
