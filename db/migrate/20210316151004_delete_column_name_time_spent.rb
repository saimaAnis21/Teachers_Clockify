class DeleteColumnNameTimeSpent < ActiveRecord::Migration[6.1]
  def change
    remove_column :time_spents, :CreatedAt, :date
  end
end
