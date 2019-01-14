class VersionsController < ApplicationController

  def index
    if params[:item_id]
      @versions = PaperTrail::Version.where(item_id: params[:item_id])
    else
      @versions = PaperTrail::Version.where(item_type: "User")
    end
  end

  def user_versions
    @versions = PaperTrail::Version.where(whodunnit: params[:whodunnit])
  end
end
