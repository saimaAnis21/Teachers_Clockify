class TimeSpentController < ApplicationController


  def new
    @ts=TimeSpent.new
    # @grp = (Group.select("name")).map { |x| x.name}
    @grp= Group.all
  end

  def create
  end


    def show
      if logged_in?
        @ts= TimeSpent.where(author_id:session[:current_user_id]).take
        @grp= @ts.groups
      else
        redirect_to session_new_path
      end
    end

    def show2
      if logged_in?
        
        t= TimeSpent.where(author_id:session[:current_user_id]).all
        
        ts_arr = (GroupTime.select("time_spent_id").distinct).map { |x| x.time_spent_id}
        
        @ts= t.where('id NOT IN (?)', Array.wrap(ts_arr))

      else
        redirect_to session_new_path
      end
    end

    def user_params
      params.require(:loghrs).permit(:name, :amount, :group_id)
    end

end
