ActiveAdmin.register Contur::Database do
  permit_params :url, :vm_username, :github_branch, :contur_type,
                :service_id, :starts_at, :ends_at, :comment

  index do
    selectable_column
    id_column
    column :vm_username
    column :github_branch
    column :contur_type
    column :created_at
    actions
  end

  filter :created_at

  form do |f|
    f.inputs do
      f.input :url
      f.input :vm_username
      f.input :github_branch
      f.input :contur_type
      f.input :service_id
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
      row :service_id
      row :starts_at
      row :ends_at
      row :comment
      row :created_at
      row :updated_at
    end
  end
end
# url
# vm_username
# comment
# contur_type
# service_id
# starts_at
# ends_at
# github_branch
# created_at
# updated_at
