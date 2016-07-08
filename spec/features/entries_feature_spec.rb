require 'rails_helper'

feature 'entries' do
  scenario   'no entries have been added' do
    visit '/'
    expect(page).to have_content 'No messages yet.'
  end
end
