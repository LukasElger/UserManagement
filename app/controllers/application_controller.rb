class ApplicationController < ActionController::Base


  def is_allowed?
    if current_user.admin?
    elsif current_user.id && params[:id]
    else
      redirect_back(fallback_location: root_path, flash: {error: "Zugriff verweigert!"})
    end
  end
end
