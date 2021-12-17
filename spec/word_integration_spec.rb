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

describe('Capitalizes word', {:type => :feature}) do
  it('capitalizes inputted word') do
    visit("/words")
    click_on('Add a new word!')
    fill_in('word_name', :with => 'banana')
    click_on('Add Word!')
    expect(page).to have_content('Banana')
  end
end

# describe('deletes a definition', {:type => :feature}) do
#   it('creates definition and then deletes the definition') do
#     word = Word.new("this", nil)
#     word.save
#     definition = Definition.new("this is it", nil, nil)
#     definition.save
#     visit("/words/:id/definitions/:id")
#     click_on('Delete Definition')
#     expect(page).to have_content('')
#   end
# end

describe('creates and updates word', {:type => :feature}) do
  it('creates a new word and then updates the name') do
    word = Word.new('Bacon', nil)
    word.save
    visit("/words/#{word.id}")
    click_on('Edit Word')
    visit("/words/#{word.id}/edit")
    fill_in('update_name', :with => 'Ham')
    click_on('Update')
    visit("/words")
    expect(page).to have_content('Ham')
  end
end

describe('creates and updates a definition', {:type => :feature}) do
  it('creates a word and definition and updates the definition name') do
    word = Word.new('Cool', 1)
    word.save
    definition = Definition.new('fact', @word.id, @definition.id)
    definition.save
    visit("/words/#{definition.word.id}/definitions/#{@definition.id}")
    fill_in('name', :with => 'fiction')
    click_on('Update definition!')
    visit("/words/#{word.id}/definitions")
    expect(page).to have_content('fiction')
  end
end

