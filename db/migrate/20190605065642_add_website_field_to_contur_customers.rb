class AddWebsiteFieldToConturCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :contur_customers, :website, :string
  end
end
