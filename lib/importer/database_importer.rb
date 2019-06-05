class DatabaseImporter
  def initialize(file)
    @file = file
  end

  def import
    csv_text = File.read(@file)
    csv = CSV.parse(csv_text, headers: true, col_sep: ",")
    csv.each do |row|
      if (row[0].present? && Contur::Database.where(id: row[0]).any?) || Contur::Database.where(url: row[1]).any?
        next
      end

      db = Contur::Database.new(url: row[1], vm_username: row[2], contur_type: row[3],
                                starts_at: row[4], ends_at: row[5], github_branch: row[6],
                                comment: row[7], server_id: row[8])
      db.save
    end
  end
end
