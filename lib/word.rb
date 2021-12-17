class Word
  attr_accessor :id, :name, :search, :description

  @@words = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
    @searched = true
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.all
    @@words.values()
  end

  def self.find(id)
    @@words[id]
  end

  def save
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def ==(other_word)
    self.name.eql?(other_word.name)
  end

  def update(name, id)
    if name.length > 0 
      @name = name
    end
  end

  def delete
    @@words.delete(self.id)
  end

  def self.search(word_searched)
    search_array = []
    @@words.values.each do |word|
      if word.name == word_searched
        search_array.push(word)
      end
    end
    search_array
  end

end