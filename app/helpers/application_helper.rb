module ApplicationHelper
  def flash_error_key(key)
    case key
    when "error"
      "danger"
    when "notice"
      "success"
    else
      key
    end
  end

  def form_search_value(param_values, attribute)
    param_values[attribute] if param_values.present?
  end
end
