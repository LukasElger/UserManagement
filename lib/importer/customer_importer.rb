class CustomerImporter
  def initialize(file)
    @file = file
  end

  def import
    csv_text = File.read(@file)
    csv = CSV.parse(csv_text, headers: true, col_sep: ",")
    csv.each do |row|
      if Contur::Customer.where(id: row[0]).any?
        next
      end

      db = Contur::Customer.new(name: row[1], tanss_number: row[2], street: row[3],
                                city: row[4], zip_code: row[5], phone_number: row[6],
                                fax: row[7], email: row[8], website: row[9], comment: row[10])
      db.save
    end
  end
end
