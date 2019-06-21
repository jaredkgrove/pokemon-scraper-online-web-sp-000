class Pokemon
  attr_accessor :name, :type, :hp
  attr_reader :id, :db

  def initialize(id: nil, name:, type:, db:, hp: nil)
    self.name = name
    self.type = type
    @id = id
    @db = db
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
    SQL
    db.execute(sql, id).collect{|row| self.new(id: row[0], name: row[1], type: row[2], db: db)}.first
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon(name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end
end
