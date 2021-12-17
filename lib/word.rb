class Word
  attr_accessor :id, :name, :search, :description

  @@words = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
    @searched = true
  end

  def self.all
    @@words.values()
  end

  def self.find(id)
    @@words[id]
  end

  def save
    
  end

end