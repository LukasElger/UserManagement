class Server < ActiveRecord::Migration[5.2]
  def change
    add_column :contur_servers, :customer_id, :integer
  end
end
