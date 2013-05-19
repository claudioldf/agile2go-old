class RemoveUserIdFromProject < ActiveRecord::Migration
  def up
    remove_column :projects, :user_ids
  end

  def down
    add_column :projects, :user_ids, :integer
  end
end
