class AddServerIdToDatabases < ActiveRecord::Migration[5.2]
  def change
    add_column :contur_databases, :server_id, :integer
  end
end
