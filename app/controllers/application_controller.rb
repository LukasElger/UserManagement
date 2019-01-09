class ApplicationController < ActionController::Base


  def require_admin!
    if !current_user.admin?
      redirect_back(fallback_location: root_path, flash: {error: "Zugriff verweigert!"})
    end
  end
end
