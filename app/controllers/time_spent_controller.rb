class TimeSpentController < ApplicationController

    def show
      
        @ts= TimeSpent.where(author_id:session[:current_user_id]).take
        @grp= @ts.groups
    end
end
