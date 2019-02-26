class CreateConturCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :contur_customers do |t|
      t.string :name
      t.string :tanss_number
      t.string :street
      t.string :city
      t.string :zip_code
      t.string :phone_number
      t.string :fax
      t.string :email
      t.text :comment

      t.timestamps
    end
  end
end
