class User < ApplicationRecord
  has_paper_trail
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

   def active_for_authentication?
      # Uncomment the below debug statement to view the properties of the returned self model values.
      # logger.debug self.to_yaml

      super && account_active?
    end

  def inactive_message
    account_active? ? super : :inactive
  end
end
