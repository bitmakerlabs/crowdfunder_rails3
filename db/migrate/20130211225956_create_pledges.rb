class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.references :user
      t.references :project
      t.integer :amount

      t.timestamps
    end
    add_index :pledges, :user_id
    add_index :pledges, :project_id
  end
end
