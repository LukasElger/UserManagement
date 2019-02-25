ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :admin
      row :account_active
      row :locale
      row :created_at
      row :updated_at
    end
  end

  filter :id
  filter :name
  filter :email
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :account_active
      f.input :admin
    end
    f.actions
  end

end
