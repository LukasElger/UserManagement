class VersionsController < ApplicationController

  def index
    @versions = PaperTrail::Version.where(item_type: "User")
      
    if params[:item_id]
      @versions = @versions.where(item_id: params[:item_id])
    end
  end

  def user_versions
    @versions = PaperTrail::Version.where(whodunnit: params[:whodunnit])
  end
end
