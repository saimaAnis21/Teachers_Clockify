class ChangeColumnNameTimeSpents < ActiveRecord::Migration[6.1]
  def change
    rename_column :time_spents, :user_id, :author_id
  end
end
