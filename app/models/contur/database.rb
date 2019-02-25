class Contur::Database < ApplicationRecord
  CONTUR = "contur".freeze
  BABYLOTSE = "babylotse".freeze
  NACHSORGE = "nachsorge".freeze
  KITA = "kita".freeze

  ANPASSUNGEN = [
    CONTUR,
    BABYLOTSE,
    NACHSORGE,
    KITA
  ]

  belongs_to :server,
    class_name: "Contur::Server",
    foreign_key: :server_id

  validates :vm_username, :contur_type, :starts_at, presence: true

  validates :contur_type, inclusion: { in: ANPASSUNGEN }

  validates :github_branch, uniqueness: true, presence: true
  validates :url, uniqueness: true, presence: true

  def self.search(query)
    scope = all
    if query[:id].present?
      scope = scope.id_search(query[:id])
    end

    if query[:url].present?
      scope = scope.url_search(query[:url])
    end

    if query[:vm_username].present?
      scope = scope.vm_search(query[:vm_username])
    end

    if query[:github_branch].present?
      scope = scope.git_search(query[:github_branch])
    end

    if query[:server_id].present?
      scope = scope.server_search(query[:server_id])
    end

    if query[:contur_type].present?
      scope = scope.type_search(query[:contur_type])
    end

    scope
  end

  def self.id_search(query)
    where("id = :id", id: query)
  end

  def self.url_search(query)
    where("url ILIKE :url", url: "%#{query}%")
  end

  def self.vm_search(query)
    where("vm_username ILIKE :vm_username", vm_username: "%#{query}%")
  end

  def self.git_search(query)
    where("github_branch ILIKE :github_branch", github_branch: "%#{query}%")
  end

  def self.server_search(query)
    where("server_id = :server_id", server_id: query)
  end

  def self.type_search(query)
    where("contur_type ILIKE :contur_type", contur_type: "%#{query}%")
  end
end
