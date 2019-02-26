class Contur::Customer < ApplicationRecord
  has_many :server,
    class_name: "Contur::Server",
    foreign_key: :customer_id,
    dependent: :destroy

  has_many :databases, through: :server
end
