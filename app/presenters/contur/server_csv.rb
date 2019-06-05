class Contur::ServerCsv
  require 'csv'

  def initialize(elements)
    @customers = elements
  end

  def to_csv(headers: true)
      CSV.generate(headers: headers) do |csv|
        csv << fields if headers
        @customers.each do |record|
          csv << fields.map {|c| record.send(c)}
        end
      end
    end

    def fields
      [
        :hostname,
        :os_version,
        :ruby_version,
        :nginx_version,
        :postgres_version,
        :admin_user,
        :access_type,
        :ip_address,
        :ssh_password,
        :ssh_port,
        :rz_access,
        :comment,
        :customer_id
      ]
    end
end
