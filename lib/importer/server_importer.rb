class ServerImporter
  def initialize(file)
    @file = file
  end

  def import
    csv_text = File.read(@file)
    csv = CSV.parse(csv_text, headers: true, col_sep: ",")
    csv.each do |row|
      if (row[0].present? && Contur::Server.where(id: row[0]).any?) || Contur::Server.where(hostname: row[1]).any?
        next
      end

      db = Contur::Server.new(hostname: row[1], os_version: row[2], ruby_version: row[3], nginx_version: row[4],
                              postgres_version: row[5], admin_user: row[6], access_type: row[7], ip_address: row[8],
                              ssh_password: row[9], ssh_port: row[10], rz_access: row[11], comment: row[12], customer_id: row[13])
      db.save
    end
  end
end
