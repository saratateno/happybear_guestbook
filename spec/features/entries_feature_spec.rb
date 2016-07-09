require 'rails_helper'

feature 'entries' do
  scenario 'no entries have been added' do
    visit '/'
    expect(page).to have_content 'No messages yet.'
  end

  context 'when adding a new entry' do
    scenario 'upon success' do
      visit '/'
      fill_in('entry[name]', with: 'Joe Bloggs')
      fill_in('entry[message]', with: 'Hello World')
      click_button('Submit')
      expect(page).to have_content 'Joe Bloggs'
      expect(page).to have_content 'Hello World'
      expect(page).not_to have_content 'No messages yet'
    end
  end
end
