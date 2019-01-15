ActiveAdmin.register PaperTrail::Version do
  permit_params :email, :password, :password_confirmation

  actions :index, :show, :destroy

  index do
    selectable_column
    id_column
    column :whodunnit do |c|
      u = User.where(id: c.whodunnit).first
      link_to u.name, admin_user_path(u) if u
    end
    column :event
    column :created_at
    actions
  end

  filter :whodunnit
  filter :event, as: :select, collection: [:create, :update, :destroy]
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do |version|
    attributes_table do
        row :id
        row :whodunnit do
          u = User.where(id: version.whodunnit).first
          link_to u.name, admin_user_path(u) if u
        end
        row :event
        row :created_at
        row :updated_at
      end
    end
end
