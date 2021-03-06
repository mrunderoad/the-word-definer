require 'rspec'
require 'definition'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("Happy", nil)
    @word.save()
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new("Cool Cat", @word.id, nil)
      definition.save
      expect(Definition.all).to(eq([definition]))
    end
  end  

  describe('.clear') do
    it("clears all songs") do
      definition = Definition.new("Dog", @word.id, nil)
      definition.save
      definition2 = Definition.new("Cat", @word.id, nil)
      definition2.save
      Definition.clear
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same definition if the same as another") do
      definition = Definition.new("cat", @word.id, nil)
      definition2 = Definition.new("cat", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns list of all definitions") do
      definition = Definition.new("thats cool", @word.id, nil)
      definition.save
      definition2 = Definition.new("thats rad", @word.id, nil)
      definition2.save
      expect(Definition.all).to(eq([definition, definition2]))
    end 
  end

  describe('.find') do
    it("finds a definition by id") do 
      definition = Definition.new("the cat", @word.id, nil)
      definition.save
      definition2 = Definition.new("whats up", @word.id, nil)
      definition2.save
      expect(Definition.find(definition.id)).to(eq(definition))
    end 
  end

  describe('#delete') do
    it("deletes definition by id") do 
      definition = Definition.new("ok", @word.id, nil)
      definition.save
      definition2 = Definition.new("yup", @word.id, nil)
      definition2.save
      definition.delete
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
      definition = Definition.new("fair", @word.id, nil)
      definition.save
      definition.update("Sweet", @word.id, nil)
      expect(definition.name).to(eq("Sweet"))
    end
  end

  describe('.find_by_word') do
    it("finds definitions for word") do
      word2 = Word.new("Weird", nil)
      word2.save
      definition = Definition.new("odd", @word.id, nil)
      definition.save
      definition2 = Definition.new("off", word2.id, nil)
      definition2.save
      expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
    end
  end

  describe('#word') do
    it("finds the word the description belongs to") do
      definition = Definition.new("cool", @word.id, nil)
      definition.save
      expect(definition.word()).to(eq(@word))
    end
  end




end