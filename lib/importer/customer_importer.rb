class CustomerImporter
  def initialize(file)
    @file = file
  end

  def import
    csv_text = File.read(@file)
    csv = CSV.parse(csv_text, headers: true, col_sep: ",")
    csv.each do |row|
      if (row[0].present? && Contur::Customer.where(id: row[0]).any?) || Contur::Customer.where(name: row[1]).any?
        next
      end

      customer = Contur::Customer.new(name: row[1], tanss_number: row[2], street: row[3],
                                city: row[4], zip_code: row[5], phone_number: row[6],
                                fax: row[7], email: row[8], website: row[9], comment: row[10])
      if customer.save
        server = Contur::Server.find(row[11])
        server.customer = customer
        server.save
      end
    end
  end
end
