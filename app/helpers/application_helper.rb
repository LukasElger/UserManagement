require 'navigation_helper.rb'

module ApplicationHelper
  include NavigationHelper

  def flash_error_key(key)
    case key
    when "error"
      "danger"
    else
      key
    end
  end
end
