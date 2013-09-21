class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :company
      #t.string :slug

      t.timestamps
    end
    #add_index :projects, :id
  end
end
