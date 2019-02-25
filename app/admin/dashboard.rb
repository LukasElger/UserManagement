ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do

      column do
        panel "Recent User" do
          ul do
            User.first(5).map do |user|
              li link_to(user.name, admin_user_path(user))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
        panel "Test" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
    
  end
end
