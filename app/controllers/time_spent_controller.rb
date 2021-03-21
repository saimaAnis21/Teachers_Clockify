class TimeSpentController < ApplicationController
  
  before_action :current_user_exist?, :include => [:new, :create, :show, :show2]

  def new
    @tss=TimeSpent.new    
    @grp= Group.all
  end

  def create
    grps= params[:loghrs][:group_id]
    amt = params[:loghrs][:amount].to_i
    @tss=current_user.time_spents.build(name:params[:loghrs][:name], Amount:amt)

          respond_to do |format|
            if @tss.save
              grps.each do |g|
                @gt = @tss.group_times.build(group_id: g)
                  @gt.save
                  end
                format.html{ redirect_to time_spent_show_path, notice: 'Entry successfully created!!' }
            else
                if @tss.errors.any?
                    format.html {redirect_to time_spent_new_path, alert: @tss.errors.full_messages }
                else 
                    format.html {redirect_to time_spent_new_path, alert: 'Entry not created!!'}
                end
                  
            end
        end
  end


    def show
      
        @ts= TimeSpent.where(author_id:session[:current_user_id]).order("created_at").last
        @grp= @ts.groups
      
    end

    def show2
     
        
        t= TimeSpent.where(author_id:session[:current_user_id]).all
        
        ts_arr = (GroupTime.select("time_spent_id").distinct).map { |x| x.time_spent_id}
        
        @ts= t.where('id NOT IN (?)', Array.wrap(ts_arr))

     
    end

    def timespent_params
      params.require(:loghrs).permit(:name, :amount, :group_id)
    end

end
