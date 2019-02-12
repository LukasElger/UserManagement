class Contur::Server < ApplicationRecord
  validates :os_version, :hostname, :admin_user, :access_type, presence: true
end
