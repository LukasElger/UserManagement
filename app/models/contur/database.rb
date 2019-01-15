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

  validates :vm_username, :contur_type, :starts_at, presence: true

  validates :contur_type, inclusion: { in: ANPASSUNGEN }

  validates :github_branch, uniqueness: true, presence: true
  validates :url, uniqueness: true, presence: true
end
