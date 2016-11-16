class CreateGroupAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :group_assignments do |t|
      t.integer :group_id, null: false
      t.integer :individual_id, null: false

      t.timestamps
    end
  end
end
