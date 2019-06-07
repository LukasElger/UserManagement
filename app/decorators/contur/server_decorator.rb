class Contur::ServerDecorator < ApplicationDecorator
  delegate_all

  def rz_bool
    if model.rz_access == true
      I18n.t("decorators.contur/server.rz_bool_yes")
    else
      I18n.t("decorators.contur/server.rz_bool_no")
    end
  end
end
