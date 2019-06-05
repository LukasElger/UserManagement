class Contur::CustomerCsv
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
        :name,
        :tanss_number,
        :street,
        :city,
        :zip_code,
        :phone_number,
        :fax,
        :email,
        :website,
        :comment
      ]
    end
end
