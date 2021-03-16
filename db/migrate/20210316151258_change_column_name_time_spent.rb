class ChangeColumnNameTimeSpent < ActiveRecord::Migration[6.1]
  def change
    rename_column :time_spents, :Name, :name
  end
end
