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
      redirect_to contur_servers_path, flash: {success: t("flash.server_created")}
    else
      flash[:danger] = t("flash.server_creation_error")
      render "new"
    end
  end

  def edit
    @db = Contur::Server.find(params[:id])
  end

  def update
    @db = Contur::Server.find(params[:id])

    if @db.update_attributes(update_params)
      redirect_to contur_servers_path, flash: {success: t("flash.server_update")}
    else
      render "edit"
    end
  end

  def destroy
    @db = Contur::Server.find(params[:id])
    @db.destroy

    redirect_to contur_servers_path, flash: {success: t("flash.server_delete")}
  end

  private

  def create_params
    params.require(:contur_server).permit( :os_version,
                                           :ruby_version,
                                           :nginx_version,
                                           :postgres_version,
                                           :hostname,
                                           :admin_user,
                                           :access_type
                                           )
  end

  def update_params
    params.require(:contur_server).permit( :os_version,
                                           :ruby_version,
                                           :nginx_version,
                                           :postgres_version,
                                           :hostname,
                                           :admin_user,
                                           :access_type
                                           )
  end
end
