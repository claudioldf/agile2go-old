class AddProjectIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :project_id, :integer
    add_index :users, :project_id
  end
end
