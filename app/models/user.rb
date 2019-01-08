class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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
end
