class RemoveFieldSlugFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :slug
  end
end
