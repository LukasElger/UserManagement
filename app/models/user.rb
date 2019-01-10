class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  def update_user_data(params)
    if params[:password].blank?
      params.delete("password")
      params.delete("password_confirmation")
    end

    self.update_attributes(params)
  end

  def self.search(value)
    where("LOWER(name) ILIKE  '#{value.downcase}%'")
  end

  def admin_human
    if admin?
      I18n.t("general.admin_true")
    else
      I18n.t("general.admin_false")
    end
  end
end
