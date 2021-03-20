class TimeSpentController < ApplicationController

    def show
      if logged_in?
        @ts= TimeSpent.where(author_id:session[:current_user_id]).take
        @grp= @ts.groups
      else
        redirect_to session_new_path
      end
    end
end
