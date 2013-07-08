class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :storie
      t.integer :priority
      t.string :hours
      t.string :status
      t.references :sprint

      t.timestamps
    end
    add_index :tasks, :sprint_id
  end
end