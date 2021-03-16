class CreateTimeSpents < ActiveRecord::Migration[6.1]
  def change
    create_table :time_spents do |t|
      t.string :Name
      t.integer :Amount
      t.date :CreatedAt
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
