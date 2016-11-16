class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :description
      t.integer :meeting_id, null: false

      t.timestamps
    end
  end
end
