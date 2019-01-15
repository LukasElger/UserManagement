class Contur::DatabasesController < ApplicationController

  def index
    @dbs = Contur::Database.order(:id).page params[:page]
  end

  def show
    @db = Contur::Database.find(params[:id])
  end

  def edit
    @db = Contur::Database.find(params[:id])
  end

  def update
    @db = Contur::Database.find(params[:id])

    if @db.update_attributes(update_params)
      redirect_to contur_databases_path, flash: {success: t("flash.db_update")}
    else
      render "edit"
    end
  end

  def destroy
    @db = Contur::Database.find(params[:id])
    @db.destroy

    redirect_to contur_databases_path, flash: {success: t("flash.db_delete")}
  end

  private

  def update_params
    params.require(:contur_database).permit( :url,
                                             :vm_username,
                                             :contur_type,
                                             :github_branch,
                                             :service_id,
                                             :starts_at,
                                             :ends_at
                                           )
  end
end
