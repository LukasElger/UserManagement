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

  def active_bagde
    if model.account_active?
      h.content_tag(:span, I18n.t("views.users.active.active"), class: "badge badge-success")
    else
      h.content_tag(:span, I18n.t("views.users.active.inactive"), class: "badge badge-danger")
    end
  end

  def toggle_switch
    if model.account_active?
      h.content_tag(:i, "", class: "fas fa-toggle-on float-right", data: {placement: "bottom", toggle: "tooltip"}, title: "#{I18n.t("tooltips.deactivate")}")
    else
      h.content_tag(:i, "", class: "fas fa-toggle-off float-right", data: {placement: "bottom", toggle: "tooltip"}, title: "#{I18n.t("tooltips.activate")}")
    end
  end

  def toggle_active_message
    if model.account_active?
      I18n.t("flash.deactivated")
    else
      I18n.t("flash.activated")
    end
  end
end
