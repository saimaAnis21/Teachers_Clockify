class GroupController < ApplicationController

    def show
        if logged_in?
            @grp = Group.where(user_id: session[:current_user_id]).all
        else
            redirect_to session_new_path
        end
    end
end
