class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.string :name, null: false
      t.string :address
      t.string :phone
      t.string :website
      t.string :affiliation
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
