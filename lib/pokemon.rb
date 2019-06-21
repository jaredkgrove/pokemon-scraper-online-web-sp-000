class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db

  def initialize(id: nil, name:, type:, db:)
    self.name = name
    self.type = type
    @id = id
    @db = db
  end

  def self.save(name, type, db)
    # if id
    #   self.update
    # else
      sql = <<-SQL
        INSERT INTO pokemon(name, type)
        VALUES (?, ?)
      SQL
      db.execute(sql, self.name, self.type)
      #@id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    # end
  end
end
