class ApplicationController < ActionController::Base


  def require_admin!
    if current_user && !current_user.admin?
      redirect_to :back, flash: {error: "Zugriff verweigert!"}
    end
  end
end
