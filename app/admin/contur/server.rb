ActiveAdmin.register Contur::Server do
  permit_params :os_version, :ruby_version, :nginx_version, :postgres_version,
                :admin_user, :access_type

  index do
    selectable_column
    id_column
    column :os_version
    column :ruby_version
    column :nginx_version
    column :postgres_version
    column :admin_user
    column :access_type
    actions
  end

  filter :id
  filter :os_version
  filter :ruby_version
  filter :nginx_version
  filter :postgres_version
  filter :admin_user
  filter :access_type, as: :select, collection: Contur::Server::ACCESS

  form do |f|
    f.inputs do
      f.input :os_version
      f.input :ruby_version
      f.input :nginx_version
      f.input :postgres_version
      f.input :admin_user
      f.input :access_type, as: :select, collection: Contur::Server::ACCESS
    end
    f.actions
  end

  show do
    attributes_table do
      row :os_version
      row :ruby_version
      row :nginx_version
      row :postgres_version
      row :admin_user
      row :access_type
      row :databases do |c|
        c.databases.map do |db|
          link_to db.vm_username, admin_contur_database_path(db)
        end.join(" ").html_safe
      end
      row :created_at
      row :updated_at
    end
  end
end
