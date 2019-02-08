class VersionsController < ApplicationController

  def index
    @versions = PaperTrail::Version.where(item_type: "User").page(params[:page])

    @item_id = params[:item_id]
    if @item_id
      @versions = @versions.where(item_id: @item_id).page(params[:page])
    end
  end

  def user_versions
    @versions = PaperTrail::Version.where(whodunnit: params[:whodunnit])
  end
end
