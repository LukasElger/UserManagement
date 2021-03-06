class Contur::DatabasesController < ApplicationController

  def index
    if params[:query]
      @dbs = Contur::Database.search(params[:query]).page params[:page]
    else
      @dbs = Contur::Database.order(:id).page params[:page]
    end

    respond_to do |format|
      format.html
      format.csv {
        @csv = Contur::DatabaseCsv.new(@dbs.limit(nil).offset(nil))
        send_data @csv.to_csv
      }
    end
  end

  def show
    @db = Contur::Database.find(params[:id]).decorate
  end

  def new
    @db = Contur::Database.new
  end

  def create
    @db = Contur::Database.new(create_params)

    if @db.save
      redirect_to contur_databases_path, flash: {success: I18n.t("flash.created", model: Contur::Database.model_name.human, count: 1)}
    else
      flash[:danger] = I18n.t("flash.creation_error", model: Contur::Database.model_name.human, count: 2)
      render "new"
    end
  end

  def edit
    @db = Contur::Database.find(params[:id])
  end

  def update
    @db = Contur::Database.find(params[:id])

    if @db.update_attributes(update_params)
      redirect_to contur_databases_path, flash: {success: I18n.t("flash.update", model: Contur::Database.model_name.human, count: 1)}
    else
      render "edit"
    end
  end

  def destroy
    @db = Contur::Database.find(params[:id])
    @db.destroy

    redirect_to contur_databases_path, flash: {success: I18n.t("flash.deleted", model: Contur::Database.model_name.human, count: 1)}
  end

  private

  def create_params
    params.require(:contur_database).permit( :url,
                                             :vm_username,
                                             :contur_type,
                                             :github_branch,
                                             :server_id,
                                             :starts_at,
                                             :ends_at,
                                             :comment
                                           )
  end

  def update_params
    params.require(:contur_database).permit( :url,
                                             :vm_username,
                                             :contur_type,
                                             :github_branch,
                                             :server_id,
                                             :starts_at,
                                             :ends_at,
                                             :comment
                                           )
  end
end
