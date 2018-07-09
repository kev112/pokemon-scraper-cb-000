class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db  = db
    
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    query = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    id = query[0]
    name = query[1]
    type = query[2]
    hp = query[3]
    db = query[4]
    self.new(id: id, name: name, type: type, db: db)

  end
end
