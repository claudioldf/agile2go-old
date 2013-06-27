class AddSlugToSprints < ActiveRecord::Migration
  def change
    add_column :sprints, :slug, :string
    add_index :sprints, :slug
  end
end
