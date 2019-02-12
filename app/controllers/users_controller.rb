class UsersController < ApplicationController
  before_action :require_admin!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @users = User.order(:id).page(params[:page])
  end

  def active
    @users = User.order(:id)
    @active = []
    @inactive = []
    @users.each do |user|
      if user.account_active?
        @active << user
      else
        @inactive << user
      end
    end
  end

  def set_account_active(user)
    if user
      u= User.get(user)
      u.account_active = false
    end
  end

  def remove_account_active(user)
    if user
      u= User.get(user)
      u.account_active = false
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_params)

    if @user.save
      redirect_to users_path, flash: {success: t("flash.created")}
    else
      flash[:danger] = t("flash.creation_error")
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
    @user = current_user

    if @user.update_with_password(update_profile_params)
      set_locale
      redirect_to root_path, flash: {success: t("flash.profile_update")}
    else
      render "edit_profile"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_user_data(account_update_params)
      set_locale
      redirect_to users_path, flash: {success: t("flash.user_update")}
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, flash: {success: t("flash.user_delete")}
  end

  def toggle_active
    @user = User.find(params[:id]).decorate
    if @user == current_user
      redirect_back(fallback_location: root_path, flash: {danger: I18n.t("flash.de/activation_error")})
    else
      @user.account_active = !@user.account_active
      @user.save(validate: false)

      redirect_back(fallback_location: root_path, flash: {success: @user.toggle_active_message})
    end
  end

  private

  def create_params
    params.require(:user).permit( :name,
                                  :email,
                                  :password,
                                  :password_confirmation,
                                  :account_active,
                                  :admin
                                )
  end

  def account_update_params
    params.require(:user).permit( :name,
                                  :email,
                                  :password,
                                  :password_confirmation,
                                  :account_active,
                                  :admin
                                )
  end

  def update_profile_params
    params.require(:user).permit( :name,
                                  :email,
                                  :password,
                                  :password_confirmation,
                                  :current_password,
                                  :locale
                                )
  end
end
