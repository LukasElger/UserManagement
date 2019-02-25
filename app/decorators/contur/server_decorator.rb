class Contur::ServerDecorator < ApplicationDecorator
  delegate_all

  def to_label
    hostname
  end
end
