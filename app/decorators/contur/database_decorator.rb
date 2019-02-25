class Contur::DatabaseDecorator < ApplicationDecorator
  delegate_all

  def server_name
    model.server.hostname if model.server
  end

  def to_label
    "#{vm_username} - #{server_name}"
  end
end
