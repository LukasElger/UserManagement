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
end
