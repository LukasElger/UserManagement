class AddPortToConturServer < ActiveRecord::Migration[5.2]
  def change
    add_column :contur_servers, :ssh_port, :string, default: "22"
  end
end
