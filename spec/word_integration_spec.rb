require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word!')
    fill_in('word_name', :with => 'Yellow')
    click_on('Add Word!')
    expect(page).to have_content('Yellow')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    word = Word.new("Yellow", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'its a color')
    click_on('Add definition')
    expect(page).to have_content('its a color')
  end
end

describe('searches for word', {:type => :feature}) do
  it('creates a word and then searches for it') do
    word = Word.new('Find', nil)
    word.save
    visit("/words")
    fill_in('search', :with => 'Find')
    click_on('Go!')
    expect(page).to have_content('Find')
  end 
end

describe('deletes a word', {:type => :feature}) do
  it('creates a word and then deletes it') do
    word = Word.new('flip', nil)
    word.save
    visit("/words/#{word.id}/edit")
    click_on('Delete word')
    expect(page).to have_content("")
  end
end

# describe('deletes a definition', {:type => :feature}) do
#   it('creates a word and definition and then deletes the definition') do
#     word = Word.new('cool', nil)
#     word.save
#     definition = Definition.new('definition', nil, nil)
#     definition.save
#     visit("/words/#{word.id}/definitions/#{definition.id}")
#     click_on('Delete Definition')
#     expect(page).to have_content("")
#   end 
# end

# describe('sorts words', {:type => :feature}) do
#   it('sorts words alphabetically') do
#     word = Word.new("Dark", nil)
#     word.save
#     word2 = Word.new("Ace", nil)
#     word2.save
#     visit("/")
#     click_on('Sort Words Alphabetically')
#     expect(page).to have_content("Ace", "Dark")
#   end
# end

describe('updates word', {:type => :feature}) do
  it('updates the name of a word') do
    word = Word.new("That", nil)
    word.save
    visit("/words/#{word.id}/edit")
    fill_in('name', :with => 'This')
    click_on('Update')
    expect("/words").to have_content('This')
  end
end

