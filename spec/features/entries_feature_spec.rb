require 'rails_helper'

feature 'entries' do
  scenario 'no entries have been added' do
    visit '/'
    expect(page).to have_content 'No messages yet.'
  end

  context 'when adding a new entry' do
    scenario 'a successful entry' do
      fill_in('entry[name]', with: 'Joe Bloggs')
      fill_in('entry[message]', with: 'Hello World')
      click_button('Submit')
      expect(page).to have_content 'Joe Bloggs'
      expect(page).to have_content 'Hello World'
    end
  end
end
