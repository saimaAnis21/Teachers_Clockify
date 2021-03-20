class SessionController < ApplicationController

    def new; end

    def create
      @user = User.find_by(session_params)
      respond_to do |format|
      if !@user.nil?
        session[:current_user_id] = @user.id
        session[:current_user_name] = @user.name.to_s
        session[:logged_in] = true
        format.html { redirect_to user_show_path, notice: 'Successfully Logged in!!' }
      else
        format.html {redirect_to session_new_path, alert: 'Invalid name!'}
      end
    end
  end

    def destroy
      reset_session
      redirect_to session_new_path
    end


  private

  def session_params
    params.require(:session).permit(:name)
  end
end
