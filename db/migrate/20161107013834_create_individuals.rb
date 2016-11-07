class CreateIndividuals < ActiveRecord::Migration[5.0]
  def change
    create_table :individuals do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :address
      t.string :email
      t.string :phone
      t.date :birthday
      t.string :notes
      t.integer :meeting_id, null: false

      t.timestamps
    end
  end
end
