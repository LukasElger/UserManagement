class ApplicationDecorator < Draper::Decorator
  # Define methods for all decorated objects.
  # Helpers are accessed through `helpers` (aka `h`). For example:
  #
  #   def percent_amount
  #     h.number_to_percentage object.amount, precision: 2
  #   end

  def print_date(date)
    date.strftime("%d.%m.%Y") if date.present?
  end

  def card_block_attr(attr)
    if model.send(attr).present?
      h.content_tag(:li) do
        h.content_tag(:dl, class: "row") do
          res = h.content_tag(:dt, model.class.human_attribute_name(attr), class: "col-sm-3")

          row = h.content_tag(:dd, model.send(attr), class: "col-sm-9")

          res << row

          res.html_safe
        end
      end
    else
      h.content_tag(:li) do
        h.content_tag(:dl, class: "row") do
          res = h.content_tag(:dt, model.class.human_attribute_name(attr), class: "col-sm-3")

          row = h.content_tag(:dd, "N/A", class: "col-sm-9")

          res << row

          res.html_safe
        end
      end
    end
  end

end
