require 'rails_helper'

feature 'adding entries' do
  before :each do
    visit '/'
  end

  scenario 'no entries have been added' do
    expect(page).to have_content 'No messages yet.'
  end

  context 'when adding a new entry' do
    scenario 'that is successful' do
      fill_in('entry[name]', with: 'Joe Bloggs')
      fill_in('entry[message]', with: 'Hello World')
      click_button('Submit')
      expect(page).to have_content 'Your message was saved. Thank you.'
      expect(page).to have_content 'Joe Bloggs'
      expect(page).to have_content 'Hello World'
      expect(page).not_to have_content 'No messages yet'
    end

    scenario 'that is missing a message' do
      fill_in('entry[name]', with: 'Joe Bloggs')
      click_button('Submit')
      expect(page).to have_content 'Message is required.'
      expect(page).to have_selector("input[value='Joe Bloggs']")
    end

    scenario 'that is missing a name' do
      fill_in('entry[message]', with: 'Hello world')
      click_button('Submit')
      expect(page).to have_content 'Name is required.'
      expect(page).to have_selector('textarea', text: 'Hello world')
    end
  end
end
