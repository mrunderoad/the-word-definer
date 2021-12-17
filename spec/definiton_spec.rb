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

end