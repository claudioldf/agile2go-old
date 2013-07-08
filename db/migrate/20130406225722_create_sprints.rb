class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.string :daily_scrum
      t.date :end_date
      t.date :start_date
      t.text :goal
      t.string :name
      t.references :project

      t.timestamps
    end
    add_index :sprints, :project_id
  end
end
