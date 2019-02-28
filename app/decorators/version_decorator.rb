class VersionDecorator < ApplicationDecorator
  decorates PaperTrail::Version
  delegate_all

  def created_at
    print_date(model.created_at)
  end

  def changes
    changes = model.object_changes
    if changes.include? "name"
      User.human_attribute_name(:name)

    elsif changes.include? "email"
      User.human_attribute_name(:email)

    elsif changes.include? "account_active"
      User.human_attribute_name(:account_active)

    elsif changes.include? "admin"
      User.human_attribute_name(:admin)

    elsif changes.include? "locale"
      User.human_attribute_name(:locale)
    end
  end
end
