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

  show do
    attributes_table do
      row :name
      row :email
      row :phone_number
      row :fax
      row :zip_code
      row :city
      row :street
      row :tanss_number
      row :comment
      row :server do |c|
        c.server.map do |s|
          link_to s.hostname, admin_contur_server_path(s)
        end.join(" ").html_safe
      end
      row :databases do |c|
        c.databases.map do |db|
          link_to db.vm_username, admin_contur_database_path(db)
        end.join(" ").html_safe
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
