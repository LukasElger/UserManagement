class ApplicationController < ActionController::Base
  before_action :set_locale


  def require_admin!
    if !current_user.admin?
      redirect_back(fallback_location: root_path, flash: {error: "Zugriff verweigert!"})
    end
  end

  def set_locale
    if current_user
      I18n.locale = current_user.locale
    end
  end
end
