class UserDecorator < ApplicationDecorator
  decorates User
  delegate_all

  def admin_human
    if model.admin?
      I18n.t("general.admin_true")
    else
      I18n.t("general.admin_false")
    end
  end

  def active_human
    if model.account_active?
      I18n.t("general.active_true")
    else
      I18n.t("general.active_false")
    end
  end
end
