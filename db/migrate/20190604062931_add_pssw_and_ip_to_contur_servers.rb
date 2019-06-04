class AddPsswAndIpToConturServers < ActiveRecord::Migration[5.2]
  def change
    add_column :contur_servers, :ip_address, :string
    add_column :contur_servers, :ssh_password, :string
  end
end
