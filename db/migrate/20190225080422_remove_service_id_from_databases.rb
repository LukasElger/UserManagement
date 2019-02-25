class RemoveServiceIdFromDatabases < ActiveRecord::Migration[5.2]
  def change
    remove_column :contur_databases, :service_id
  end
end
