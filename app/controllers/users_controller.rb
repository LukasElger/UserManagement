class UsersController < ApplicationController

  before_action :require_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @users = User.all
    #@users = User.search(params[:search])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_params)

    if @user.save
      redirect_to users_path, flash: {success: "Benutzer wurde erfolgreich erstellt!"}
    else
      flash[:error] = "Fehler bei der Erstellung des Benutzers. Bitte überprüfen Sie Ihre Eingaben."
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_user_data(account_update_params)
      @user.save
      redirect_to users_path, flash: {success: "Der Benutzer wurde erfolgreich geupdatet!"}
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, flash: {success: "Der Benutzer wurde erfolgreich gelöscht!"}
  end

  private

  def create_params
    params.require(:user).permit( :name,
                                  :email,
                                  :password,
                                  :password_confirmation
                                )
  end

  def account_update_params
    params.require(:user).permit( :name,
                                  :email,
                                  :password,
                                  :password_confirmation,
                                  :admin
                                )
  end
end
