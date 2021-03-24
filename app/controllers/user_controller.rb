class UserController < ApplicationController
  before_action :current_user_exist?, only: [:show]

  def def(_new)
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    respond_to do |format|
      if @user.save
        session_var(format)

      elsif @user.errors.any?
        format.html { redirect_to new_user_path, alert: @user.errors.full_messages }
      else
        format.html { redirect_to new_user_path, alert: 'Invalid name!!' }

      end
    end
  end

  def show
    @user = User.find_by(id: session[:current_user_id])
    @total_hrs = @user.time_spents.sum('Amount')
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
