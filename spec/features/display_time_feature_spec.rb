require 'rails_helper'

feature 'display time' do
  let(:entry) { create(:entry) }

  before :all do
    DatabaseCleaner.start
    @CREATION_TIME = Time.local(2016, 1, 1, 10, 0, 0)
    Timecop.freeze(@CREATION_TIME)
  end

  after :all do
    DatabaseCleaner.clean
  end

  scenario 'when viewed 1 hour later' do
    entry
    Timecop.freeze(@CREATION_TIME + 1.hour)
    visit '/'
    expect(page).to have_content 'about 1 hour ago'
  end

  scenario 'when viewed 1 day later' do
    entry
    Timecop.freeze(@CREATION_TIME + 1.day + 1.hour)
    visit '/'
    expect(page).to have_content '1 day ago'
  end

  scenario 'when viewed 10 days later' do
    entry
    Timecop.freeze(@CREATION_TIME + 10.day + 13.hour)
    visit '/'
    expect(page).to have_content '10 days ago'
  end

  scenario 'when viewed 3 months later' do
    entry
    Timecop.freeze(@CREATION_TIME + 3.month)
    visit '/'
    expect(page).to have_content '3 months ago'
  end
end
