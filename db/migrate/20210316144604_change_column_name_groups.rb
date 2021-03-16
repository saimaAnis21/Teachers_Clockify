class ChangeColumnNameGroups < ActiveRecord::Migration[6.1]
  def change
    rename_column :groups, :Name, :name
  end
end
