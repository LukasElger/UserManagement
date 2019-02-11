class CreateConturServers < ActiveRecord::Migration[5.2]
  def change
    create_table :contur_servers do |t|
      t.string :os_version
      t.string :ruby_version
      t.string :nginx_version
      t.string :postgres_version
      t.string :hostname
      t.string :admin_user
      t.string :access_type

      t.timestamps
    end
  end
end
