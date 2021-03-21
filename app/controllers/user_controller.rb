class UserController < ApplicationController
    
    before_action :current_user_exist?, :include => [:show]

    def def new
       @user=User.new
    end

    def create
        if !logged_in?
            @user = User.create(user_params)
            
            respond_to do |format|
                if @user.save
                    format.html{ redirect_to session_new_path, notice: 'User successfully created!!' }
                else
                    if @user.errors.any?
                        format.html {redirect_to user_new_path, alert: @user.errors.full_messages }
                    else 
                        format.html {redirect_to user_new_path, alert: 'Invalid name!!'}
                    end
                       
                end
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
