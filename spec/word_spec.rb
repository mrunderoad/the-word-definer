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

end
