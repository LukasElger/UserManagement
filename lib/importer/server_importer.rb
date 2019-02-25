class ServerImporter
  def initialize(file)
    @file = file
  end

  def import(validate: true)
    csv_text = File.read(@file)
    csv = CSV.parse(csv_text, headers: true, col_sep: ";")
    csv.each do |row|
      c = Contur::Server.new(os_version: row[3], ruby_version: row[1], postgres_version: row[2], access_type: row[4], hostname: row[0])
      c.admin_user = "sektor"
      c.save(validate: validate)
    end
  end
end
