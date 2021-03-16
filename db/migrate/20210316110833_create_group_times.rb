class CreateGroupTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :group_times do |t|
      t.references :time_spent, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
