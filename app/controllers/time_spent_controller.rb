# rubocop:disable Metrics/PerceivedComplexity
class TimeSpentController < ApplicationController
  before_action :current_user_exist?, include: %i[new new2 create create2 show show2]

  def new
    @tss = TimeSpent.new
    @grp = Group.all
  end

  def create
    if params[:loghrs][:group_id] == [''] && params[:loghrs][:withgrp]
      redirect_to new_time_spent_path, notice: 'Please select Grade(s)'
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
        else
          format.html { redirect_to new_time_spent_path, alert: @tss.errors.full_messages }
        end
      end
    end
  end

  def planchecknew
    @ts2 = TimeSpent.new
  end

  def show
    @ts = current_user.time_spents.where('id IN (?)', GroupTime.select('time_spent_id')).last
    @grp = @ts.groups unless @ts.nil?
  end

  def plancheckshow
    @ts = current_user.time_spents.where('id NOT IN (?)', GroupTime.select('time_spent_id')).order(created_at: :desc)
  end

  private

  def timespent_params
    params.require(:loghrs).permit(:name, :amount, :group_id, :withgrp)
  end
end
# rubocop:enable Metrics/PerceivedComplexity
