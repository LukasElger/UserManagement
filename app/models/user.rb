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

   def active_for_authentication?
      # Uncomment the below debug statement to view the properties of the returned self model values.
      # logger.debug self.to_yaml

      super && account_active?
    end

  def inactive_message
    account_active? ? super : :inactive
  end

  def self.search(query)
    scope = all
    if query[:id].present?
      scope = scope.id_search(query[:id])
    end

    if query[:name].present?
      scope = scope.name_search(query[:name])
    end

    if query[:email].present?
      scope = scope.email_search(query[:email])
    end

    if query[:account_active].present?
      scope = scope.active_search(query[:account_active])
    end

    scope
  end

  def self.id_search(query)
    where("id = :id", id: query)
  end

  def self.name_search(query)
    where("name ILIKE :name", name: "%#{query}%")
  end

  def self.email_search(query)
    where("email ILIKE :email", email: "%#{query}%")
  end

  def self.active_search(query)
    where("account_active = :account_active", account_active: query)
  end
end
