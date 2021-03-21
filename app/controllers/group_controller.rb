class GroupController < ApplicationController
    before_action :current_user_exist?, :include => [:show]
    def show
       
        @grp = Group.where(user_id: session[:current_user_id]).order(created_at: :desc).all
        
    end

    def new
        @grp= Group.new
    end

    def create
      @grp= current_user.groups.build(name:params[:group][:name], Icon:params[:group][:icon] )

            respond_to do |format|
              if @grp.save
                  format.html{ redirect_to group_show_path, notice: 'Group successfully created!!' }
              else
                  if @grp.errors.any?
                      format.html {redirect_to group_new_path, alert: @grp.errors.full_messages }
                  else 
                      format.html {redirect_to group_new_path, alert: 'Group not created!'}
                  end
                    
              end
          end
    end

    private

  def group_params
    params.require(:group).permit(:name,:icon)
  end

end
