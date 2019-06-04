class DatabaseImporter
  def initialize(file)
    @file = file
  end

  def import
    csv_text = File.read(@file)
    csv = CSV.parse(csv_text, headers: true, col_sep: ";")
    csv.each do |row|
      if Contur::Database.where(id: row[0]).any?
        next
      end

      db = Contur::Database.new(url: row[1], vm_username: row[2], comment: row[3],
                                contur_type: row[4], starts_at: row[5], ends_at: row[6],
                                github_branch: row[7]) #Server_ID??
      db.save
    end
  end
end
