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