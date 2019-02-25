ActiveAdmin.register Contur::Database do
  permit_params :url, :vm_username, :github_branch, :contur_type,
                :server_id, :starts_at, :ends_at, :comment

  index do
    selectable_column
    id_column
    column :server
    column :vm_username
    column :github_branch
    column :contur_type
    column :created_at
    actions
  end

  filter :id
  filter :server, as: :select, collection:Contur::Server.order(:hostname).decorate
  filter :vm_username
  filter :github_branch
  filter :contur_type, as: :select, collection: Contur::Database::ANPASSUNGEN
  filter :created_at

  form do |f|
    f.inputs do
      f.input :url
      f.input :vm_username
      f.input :github_branch
      f.input :contur_type
      f.input :server, as: :select, collection: Contur::Server.order(:hostname).decorate
      f.input :starts_at
      f.input :ends_at
      f.input :comment
    end
    f.actions
  end

  show do
    attributes_table do
      row :url
      row :vm_username
      row :github_branch
      row :contur_type
      row :server
      row :starts_at
      row :ends_at
      row :comment
      row :created_at
      row :updated_at
    end
  end
end
