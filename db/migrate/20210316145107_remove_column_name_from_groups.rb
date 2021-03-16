class RemoveColumnNameFromGroups < ActiveRecord::Migration[6.1]
  def change
    remove_column :groups, :CreatedAt, :date
  end
end
