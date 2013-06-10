class AddTaskIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :task_id, :integer
    add_index :users, :task_id
  end
end
