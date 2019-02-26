class Contur::Server < ApplicationRecord
  EXTERN = "Extern".freeze
  RZ = "RZ".freeze
  VPN = "VPN".freeze
  SSH = "SSH".freeze

  ACCESS = [
    EXTERN,
    RZ,
    VPN,
    SSH
  ]

  validates :os_version, :hostname, :admin_user, :access_type, presence: true

  has_many :databases,
    class_name: "Contur::Database",
    foreign_key: :server_id,
    dependent: :destroy

  belongs_to :customer,
    class_name: "Contur::Customer",
    foreign_key: :customer_id
    
  def self.search(query)
    scope = all
    if query[:id].present?
      scope = scope.id_search(query[:id])
    end

    if query[:os_version].present?
      scope = scope.os_search(query[:os_version])
    end

    if query[:ruby_version].present?
      scope = scope.ruby_search(query[:ruby_version])
    end

    if query[:nginx_version].present?
      scope = scope.nginx_search(query[:nginx_version])
    end

    if query[:postgres_version].present?
      scope = scope.postgres_search(query[:postgres_version])
    end

    if query[:hostname].present?
      scope = scope.hostname_search(query[:hostname])
    end

    if query[:admin_user].present?
      scope = scope.admin_search(query[:admin_user])
    end

    if query[:access_type].present?
      scope = scope.access_search(query[:access_type])
    end

    if query[:database_id].present?
      scope = scope.database_search(query[:database_id])
    end

    scope
  end

  def self.id_search(query)
    where("id = :id", id: query)
  end

  def self.os_search(query)
    where("os_version ILIKE :os_version", os_version: "%#{query}%")
  end

  def self.ruby_search(query)
    where("ruby_version ILIKE :ruby_version", ruby_version: "%#{query}%")
  end

  def self.nginx_search(query)
    where("nginx_version ILIKE :nginx_version", nginx_version: "%#{query}%")
  end

  def self.postgres_search(query)
    where("postgres_version ILIKE :postgres_version", postgres_version: "%#{query}%")
  end

  def self.hostname_search(query)
    where("hostname ILIKE :hostname", hostname: "%#{query}%")
  end

  def self.admin_search(query)
    where("admin_user ILIKE :admin_user", admin_user: "%#{query}%")
  end

  def self.access_search(query)
    where("access_type ILIKE :access_type", access_type: "%#{query}%")
  end

  def self.database_search(query)
    joins(:databases).where("contur_databases.id = ?", query)
  end
end
