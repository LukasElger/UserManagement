ActiveAdmin.register Contur::Customer do
  permit_params :name, :email, :phone_number, :zip_code,
                :tanss_number, :street, :city, :fax, :comment

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :phone_number
    column :zip_code
    column :street
    column :tanss_number
    actions
  end

  filter :id
  filter :name
  filter :email
  filter :phone_number
  filter :fax
  filter :zip_code
  filter :city
  filter :street
  filter :tanss_number

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :phone_number
      f.input :fax
      f.input :zip_code
      f.input :city
      f.input :street
      f.input :tanss_number
    end
    f.actions
  end
end
