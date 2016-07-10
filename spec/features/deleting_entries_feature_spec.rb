require 'rails_helper'

feature 'deleting entries' do
  let(:entry) { create(:entry) }

  before :all do
    DatabaseCleaner.start
  end

  after :all do
    DatabaseCleaner.clean
  end

  scenario 'when deleting' do
    entry
    visit '/'
    expect { click_link('delete') }.to change(Entry, :count).by(-1)
  end
end
