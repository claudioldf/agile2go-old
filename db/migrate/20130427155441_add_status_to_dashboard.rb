class AddStatusToDashboard < ActiveRecord::Migration
  def change
    add_column :dashboards, :status, :string
    add_column :dashboards, :qtd, :string
  end
end
