class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :company
      t.text :description
      t.string :name

      t.timestamps
    end    
  end
end
