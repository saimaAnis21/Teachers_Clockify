class UserController < ApplicationController
  before_action :current_user_exist?, only: [:show]

  def def(_new)
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to session_new_path, notice: 'User successfully created!!' }
      elsif @user.errors.any?
        format.html { redirect_to user_new_path, alert: @user.errors.full_messages }
      else
        format.html { redirect_to user_new_path, alert: 'Invalid name!!' }

      end
    end
  end

  def show
    @user = User.find_by(id: session[:current_user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
