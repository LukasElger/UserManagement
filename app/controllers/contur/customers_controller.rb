class Contur::CustomersController < ApplicationController

  def index
    if params[:query]
      @cs = Contur::Customer.search(params[:query]).page params[:page]
    else
      @cs = Contur::Customer.order(:id).page params[:page]
    end
  end

  def show
    @cr = Contur::Customer.find(params[:id])
  end

  def new
    @cr = Contur::Customer.new
  end

  def create
    @cr = Contur::Customer.new(create_params)

    if @cr.save
      redirect_to contur_customers_path, flash: {success: I18n.t("flash.created", model: Contur::Customer.model_name.human, count: 1)}
    else
      flash[:danger] = I18n.t("flash.creation_error", model: Contur::Customer.model_name.human, count: 1)
      render "new"
    end
  end

  def edit
    @cr = Contur::Customer.find(params[:id])
  end

  def update
    @cr = Contur::Customer.find(params[:id])

    if @cr.update_attributes(update_params)
      redirect_to contur_customers_path, flash: {success: I18n.t("flash.update", model: Contur::Customer.model_name.human, count: 1)}
    else
      render "edit"
    end
  end

  private

  def create_params
    params.require(:contur_customer).permit( :name,
                                             :email,
                                             :phone_number,
                                             :fax,
                                             :zip_code,
                                             :city,
                                             :street,
                                             :tanss_number,
                                             :comment
                                           )
  end

  def update_params
    params.require(:contur_customer).permit( :name,
                                             :email,
                                             :phone_number,
                                             :fax,
                                             :zip_code,
                                             :city,
                                             :street,
                                             :tanss_number,
                                             :comment
                                           )
  end
end
