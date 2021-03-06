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

  def toggle_admin_message
    if model.admin?
      I18n.t("flash.admin.activated")
    else
      I18n.t("flash.admin.deactivated")
    end
  end

  def toggle_admin_switch
    if model.admin?
      h.content_tag(:i, "", class: "fas fa-toggle-on float-right", data: {placement: "bottom", toggle: "tooltip"}, title: "#{I18n.t("tooltips.deactivate")}")
    else
      h.content_tag(:i, "", class: "fas fa-toggle-off float-right", data: {placement: "bottom", toggle: "tooltip"}, title: "#{I18n.t("tooltips.activate")}")
    end
  end

  def active_human
    if model.account_active?
      I18n.t("decorators.user.active_true")
    else
      I18n.t("decorators.user.active_false")
    end
  end

  def active_mark
    if model.account_active?
      h.content_tag(:i,"", class: "fas fa-check")
    else
      h.content_tag(:i,"", class: "fas fa-times")
    end
  end

  def active_badge
    if model.account_active?
      h.content_tag(:span, I18n.t("views.users.active.active"), class: "badge badge-success")
    else
      h.content_tag(:span, I18n.t("views.users.active.inactive"), class: "badge badge-danger")
    end
  end

  def toggle_active_switch
    if model.account_active?
      h.content_tag(:i, "", class: "fas fa-toggle-on float-right", data: {placement: "bottom", toggle: "tooltip"}, title: "#{I18n.t("tooltips.deactivate")}")
    else
      h.content_tag(:i, "", class: "fas fa-toggle-off float-right", data: {placement: "bottom", toggle: "tooltip"}, title: "#{I18n.t("tooltips.activate")}")
    end
  end

  def toggle_active_message
    if model.account_active?
      I18n.t("flash.status.activated")
    else
      I18n.t("flash.status.deactivated")
    end
  end
end
