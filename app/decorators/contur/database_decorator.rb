class Contur::DatabaseDecorator < ApplicationDecorator
  delegate_all

  def server_name
    model.server.hostname if model.server
  end

end
