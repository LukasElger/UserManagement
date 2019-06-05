class Contur::CustomerDecorator < ApplicationDecorator
  delegate_all

  def to_label
    name
  end

  def n_a_attribute(attr)
    if model.send(attr).present?
      model.send(attr).truncate(10)
    else
      "N/A"
    end
  end

end
