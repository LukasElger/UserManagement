class Contur::Customer < ApplicationRecord
  has_many :server,
    class_name: "Contur::Server",
    foreign_key: :customer_id,
    dependent: :destroy

  has_many :databases, through: :server

  def self.search(query)
    scope = all
    if query[:id].present?
      scope = scope.id_search(query[:id])
    end

    if query[:name].present?
      scope = scope.url_search(query[:name])
    end

    if query[:email].present?
      scope = scope.vm_search(query[:email])
    end

    if query[:phone_number].present?
      scope = scope.git_search(query[:phone_number])
    end

    if query[:zip_code].present?
      scope = scope.server_search(query[:zip_code])
    end

    if query[:street].present?
      scope = scope.type_search(query[:street])
    end

    if query[:tanss_number].present?
      scope = scope.type_search(query[:tanss_number])
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

  def self.phone_search(query)
    where("phone_number ILIKE :phone_number", phone_number: "%#{query}%")
  end

  def self.zip_search(query)
    where("zip_code = :zip_code", zip_code: "%#{query}%")
  end

  def self.street_search(query)
    where("street ILIKE :street", street: "%#{query}%")
  end

  def self.tanss_search(query)
    where("tanss_number ILIKE :tanss_number", tanss_number: "%#{query}%")
  end
end
