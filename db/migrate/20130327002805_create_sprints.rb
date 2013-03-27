class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :daily_scrum
      t.string :goal
      t.references :project

      t.timestamps
    end
    add_index :sprints, :project_id
  end
end
