class Contur::CustomerDecorator < ApplicationDecorator
  delegate_all

  def to_label
    name
  end
end
