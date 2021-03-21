class GroupController < ApplicationController
    before_action :current_user_exist?, :include => [:show]
    def show
       
        @grp = Group.where(user_id: session[:current_user_id]).all
        
    end
end
