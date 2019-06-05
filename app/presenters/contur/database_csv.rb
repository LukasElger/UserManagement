class Contur::DatabaseCsv
  require 'csv'

  def initialize(elements)
    @dbs = elements
  end

  def to_csv(headers: true)
      CSV.generate(headers: headers) do |csv|
        csv << fields if headers
        @dbs.each do |record|
          csv << fields.map {|c| record.send(c)}
        end
      end
    end

    def fields
      [
        :url,
        :vm_username,
        :contur_type,
        :starts_at,
        :ends_at,
        :github_branch,
        :comment,
        :server_id
      ]
    end
end
