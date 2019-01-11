class UserDecorator < Draper::Decorator
  delegate_all

  def admin_human(user)
    if user.admin?
      I18n.t("general.admin_true")
    else
      I18n.t("general.admin_false")
    end
  end

  def active_human(user)
    if user.account_active?
      I18n.t("general.active_true")
    else
      I18n.t("general.active_false")
    end
  end

  def created_at(user)
    date = user.versions.last.created_at
    date.strftime("%d.%m.%Y")
  end
end
