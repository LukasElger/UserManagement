class Contur::ServersController < ApplicationController
  def index
    @dbs = Contur::Server.order(:id).page params[:page]
  end

  def show
    @db = Contur::Server.find(params[:id])
  end

  def new
    @db = Contur::Server.new
  end

  def create
    @db = Contur::Server.new(create_params)

    if @db.save
      redirect_to contur_databases_path, flash: {success: t("flash.db_created")}
    else
      flash[:danger] = t("flash.db_creation_error")
      render "new"
    end
  end

  def edit
    @db = Contur::Server.find(params[:id])
  end

  def update
    @db = Contur::Server.find(params[:id])

    if @db.update_attributes(update_params)
      redirect_to contur_databases_path, flash: {success: t("flash.db_update")}
    else
      render "edit"
    end
  end

  def destroy
    @db = Contur::Server.find(params[:id])
    @db.destroy

    redirect_to contur_databases_path, flash: {success: t("flash.db_delete")}
  end

  private

  def create_params
    params.require(:contur_server).permit( :url,
                                           :vm_username,
                                           :contur_type,
                                           :github_branch,
                                           :service_id,
                                           :starts_at,
                                           :ends_at,
                                           :comment
                                           )
  end

  def update_params
    params.require(:contur_server).permit( :url,
                                           :vm_username,
                                           :contur_type,
                                           :github_branch,
                                           :service_id,
                                           :starts_at,
                                           :ends_at,
                                           :comment
                                           )
  end
end
