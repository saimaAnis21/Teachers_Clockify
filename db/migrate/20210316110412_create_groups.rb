class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :Name
      t.string :Icon
      t.date :CreatedAt
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
