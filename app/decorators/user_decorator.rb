class UserDecorator < ApplicationDecorator
  decorates User
  delegate_all

  def admin_human
    if model.admin?
      I18n.t("decorators.user.admin_true")
    else
      I18n.t("decorators.user.admin_false")
    end
  end

  def active_human
    if model.account_active?
      I18n.t("decorators.user.active_true")
    else
      I18n.t("decorators.user.active_false")
    end
  end

  def active_badge
    if model.account_active?
      h.content_tag(:span, I18n.t("decorators.user.active"), class: "badge badge-success")
    else
      h.content_tag(:span, I18n.t("decorators.user.inactive"), class: "badge badge-danger")
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
      I18n.t("flash.activated")
    else
      I18n.t("flash.deactivated")
    end
  end
end
