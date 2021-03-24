class TimeSpentController < ApplicationController
  before_action :current_user_exist?, include: %i[new new2 create create2 show show2]

  def new
    @tss = TimeSpent.new
    @grp = Group.all
  end

  def create
    if params[:loghrs][:group_id] == [''] && params[:loghrs][:withgrp]
      respond_to do |f|
        f.html { redirect_to new_time_spent_path, notice: 'Please select Grade(s)' }
      end
    else
      @tss = current_user.time_spents.build(name: params[:loghrs][:name], Amount: params[:loghrs][:amount].to_i)

      respond_to do |format|
        if @tss.save
          if !params[:loghrs][:group_id].nil?
            @tss.create_gt(params[:loghrs][:group_id])
            format.html { redirect_to time_spent_path, notice: 'time_spent Entry successfully created!!' }

          else
            format.html { redirect_to plancheckshow_time_spent_path, notice: 'plan_check Entry successfully created!!' }
          end

        elsif @tss.errors.any?
          format.html { redirect_to new_time_spent_path, alert: @tss.errors.full_messages }
        else
          format.html { redirect_to new_time_spent_path, alert: 'Entry not created!!' }

        end
      end
    end
  end

  def planchecknew
    @ts2 = TimeSpent.new
  end

  # def create2
  #   amt = params[:loghrs][:amount].to_i
  #   @ts2 = current_user.time_spents.build(name: params[:loghrs][:name], Amount: amt)
  #   respond_to do |format|
  #     if @ts2.save

  #       format.html { redirect_to time_spent_plan_check_path, notice: 'Entry successfully created!!' }
  #     elsif @ts2.errors.any?
  #       format.html { redirect_to time_spent_plan_check_new_path, alert: @ts2.errors.full_messages }
  #     else
  #       format.html { redirect_to time_spent_plan_check_new_path, alert: 'Entry not created!!' }

  #     end
  #   end
  # end

  def show
    # t = TimeSpent.where(author_id: session[:current_user_id]).all
    # ts_arr = GroupTime.select('time_spent_id').distinct.map(&:time_spent_id)
    # @ts = t.where('id IN (?)', Array.wrap(ts_arr)).order(:created_at).last
    @ts = current_user.time_spents.where('id IN (?)', GroupTime.select('time_spent_id')).last
    @grp = @ts.groups unless @ts.nil?
  end

  def plancheckshow
    # t = TimeSpent.where(author_id: session[:current_user_id]).all
    # ts_arr = GroupTime.select('time_spent_id').distinct.map(&:time_spent_id)
    # @ts = t.where('id NOT IN (?)', Array.wrap(ts_arr)).order(created_at: :desc)
    @ts = current_user.time_spents.where('id NOT IN (?)', GroupTime.select('time_spent_id')).order(created_at: :desc)
  end

  private

  def timespent_params
    params.require(:loghrs).permit(:name, :amount, :group_id, :withgrp)
  end
end
