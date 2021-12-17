require 'rspec'
require 'word'


  describe '#Word' do
    before(:each) do
    Word.clear
    end
     
  
  describe('.all') do
    it("returns an empty array when there are no words.") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a word") do
      word = Word.new("Extra", nil)
      word.save
      expect(Word.all).to(eq([word]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another") do
      word = Word.new("Crazy", nil)
      word2 = Word.new("Crazy", nil)
      expect(word).to(eq(word2))
    end
  end

  describe('.clear') do 
    it("clears all albums") do
      word = Word.new("Cool", nil)
      word.save
      word2 = Word.new("Rad", nil)
      word2.save
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word = Word.new("Far", nil)
      word.save
      word2 = Word.new("Near", nil)
      word2.save
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word = Word.new("Cool", '')
      word.save
      word.update("Bad", '')
      expect(word.name).to(eq("Bad"))
    end 
  end

  describe('#delete') do
    it("deletes a word by id") do
      word = Word.new("Great", nil)
      word.save
      word2 = Word.new("Awesome", nil)
      word2.save
      word.delete
      expect(Word.all).to(eq([word2]))
    end 
  end 

  describe('.search') do
    it("searches for a word by name") do
      word = Word.new("This", nil)
      word.save
      expect(Word.search("This")).to(eq([word]))
    end 
  end

  describe('.sort') do
    it("sorts words alphabetically") do
      word = Word.new("Tagel", nil)
      word.save
      word2 = Word.new("Anagram", nil)
      word2.save
      Word.sort
      expect(Word.all).to(eq([word2, word]))
    end
  end



end
