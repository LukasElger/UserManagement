class VersionsController < ApplicationController

  def index
    if params[:query]
      @versions = custom_search(PaperTrail::Version.where(item_type: "User"), params[:query]).order("id DESC").page params[:page]
    else
      @versions = PaperTrail::Version.where(item_type: "User").order("id DESC").page params[:page]
    end

    if params[:item_id]
      @item_id = params[:item_id]
      @versions = @versions.where(item_id: @item_id).page(params[:page])
    end
  end

  def user_versions
    @versions = PaperTrail::Version.where(whodunnit: params[:whodunnit])
  end

  private

  def custom_search(scope, query)
    if query[:id].present?
      scope = id_search(scope, query[:id])
    end

    if query[:event].present?
      scope = event_search(scope, query[:event])
    end

    if query[:created_at].present?
      scope = created_search(scope, query[:created_at])
    end

    scope
  end

  def id_search(scope, query)
    scope.where("item_id = :id", id: query)
  end

  def event_search(scope, query)
    scope.where("event ILIKE :event", event: "%#{query}%")
  end

  def created_search(scope, query)
    scope.where("created_at = :created_at", created_at: query)
  end
end
