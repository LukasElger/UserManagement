class Contur::Database < ApplicationRecord
  validates :url, :vm_username, :github_branch, :contur_type, :starts_at, presence: true
  validates :url, :github_branch, uniqueness: true
end
