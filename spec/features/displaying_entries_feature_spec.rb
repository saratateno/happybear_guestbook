require 'rails_helper'

feature 'displaying entries' do
  let(:entry) { create(:entry) }

  before :all do
    DatabaseCleaner.start
  end

  after :all do
    DatabaseCleaner.clean
  end

  context 'display the age of an entry' do
    scenario '1 hour later' do
      entry
      Timecop.travel(1.hour)
      visit '/'
      expect(page).to have_content 'about 1 hour ago'
    end

    scenario '1 day later' do
      entry
      Timecop.travel(1.day)
      visit '/'
      expect(page).to have_content '1 day ago'
    end

    scenario '10 days later' do
      entry
      Timecop.travel(10.day)
      visit '/'
      expect(page).to have_content '10 days ago'
    end

    scenario '3 months later' do
      entry
      Timecop.travel(3.month)
      visit '/'
      expect(page).to have_content '3 months ago'
    end
  end

  context 'when multiple entries exist' do
    scenario 'shows the most recent entry first' do
      @entries = {}
      (1..3).each do |num|
        @entries[num] = create(:entry)
      end
      visit '/'
      expect(page.body.index(@entries[2].name))
        .to be < page.body.index(@entries[1].name)
      expect(page.body.index(@entries[3].name))
        .to be < page.body.index(@entries[2].name)
    end
  end
end
