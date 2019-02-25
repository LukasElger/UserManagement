class Contur::ServersController < ApplicationController
  def index
    if params[:query]
      @servers = Contur::Server.search(params[:query]).page params[:page]
    else
      @servers = Contur::Server.order(:id).page params[:page]
    end
  end

  def show
    @server = Contur::Server.find(params[:id])
    @dbs = @server.databases
  end

  def new
    @server = Contur::Server.new
  end

  def create
    @server = Contur::Server.new(create_params)

    if @server.save
      redirect_to contur_servers_path, flash: {success: I18n.t("flash.created", model: Contur::Server.model_name.human, count: 1)}
    else
      flash[:danger] = I18n.t("flash.creation_error", model: Contur::Server.model_name.human, count: 1)
      render "new"
    end
  end

  def edit
    @server = Contur::Server.find(params[:id])
  end

  def update
    @server = Contur::Server.find(params[:id])

    if @server.update_attributes(update_params)
      redirect_to contur_servers_path, flash: {success: I18n.t("flash.update", model: Contur::Server.model_name.human, count: 1)}
    else
      render "edit"
    end
  end

  def destroy
    @server = Contur::Server.find(params[:id])
    @server.destroy

    redirect_to contur_servers_path, flash: {success: I18n.t("flash.deleted", model: Contur::Server.model_name.human, count: 1)}
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
