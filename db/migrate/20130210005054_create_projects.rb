class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :teaser
      t.references :user
      t.text :description
      t.integer :goal

      t.timestamps
    end
    add_index :projects, :user_id
  end
end
