class ApplicationController < ActionController::Base
  before_action :set_locale, :set_paper_trail_whodunnit

  def index
    @users = User.limit(10).order(created_at: :desc)
  end

  def require_admin!
    if !current_user.admin?
      redirect_back(fallback_location: root_path, flash: {error: I18n.t("flash.general.denied")})
    end
  end

  def set_locale
    if current_user
      I18n.locale = current_user.locale
    end
  end
end
