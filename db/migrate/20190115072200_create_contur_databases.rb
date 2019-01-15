class CreateConturDatabases < ActiveRecord::Migration[5.2]
  def change
    create_table :contur_databases do |t|
      t.string :url
      t.string :vm_username
      t.text :comment
      t.string :contur_type
      t.integer :service_id
      t.date :starts_at
      t.date :ends_at
      t.string :github_branch

      t.timestamps
    end
  end
end
