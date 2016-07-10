require 'rails_helper'

feature 'display time' do
  let(:entry) { create(:entry) }

  before :all do
    DatabaseCleaner.start
    @BASETIME = Time.local(2016, 1, 1, 10, 0, 0)
    Timecop.freeze(@BASETIME)
  end

  after :all do
    DatabaseCleaner.clean
  end

  context 'display the age of an entry' do
    scenario '1 hour later' do
      entry
      Timecop.freeze(@BASETIME + 1.hour)
      visit '/'
      expect(page).to have_content 'about 1 hour ago'
    end

    scenario '1 day later' do
      entry
      Timecop.freeze(@BASETIME + 1.day + 1.hour)
      visit '/'
      expect(page).to have_content '1 day ago'
    end

    scenario '10 days later' do
      entry
      Timecop.freeze(@BASETIME + 10.day + 13.hour)
      visit '/'
      expect(page).to have_content '10 days ago'
    end

    scenario '3 months later' do
      entry
      Timecop.freeze(@BASETIME + 3.month)
      visit '/'
      expect(page).to have_content '3 months ago'
    end
  end

  context 'when multiple entries exist' do
    scenario 'show the most recent entry first' do
      @entries = {}
      (1...4).each do |num|
        Timecop.freeze(@BASETIME + num.day)
        @entries[num] = create(:entry, name: "Person#{num}")
      end
      Timecop.freeze(@BASETIME + 1.month)
      visit '/'
      expect(page.body.index(@entries[2].name)).to be < page.body.index(@entries[1].name)
      expect(page.body.index(@entries[4].name)).to be < page.body.index(@entries[2].name)
    end
  end
end
