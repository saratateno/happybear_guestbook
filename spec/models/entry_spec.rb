require 'rails_helper'

RSpec.describe Entry, type: :model do
  context 'when creating a new entry' do
    it 'gives an error message if name is not present' do
      expect(build(:entry, name: nil).errors_on(:name))
        .to include('is required.')
    end

    it 'gives an error message if message is not present' do
      expect(build(:invalid_entry).errors_on(:message))
        .to include('is required.')
    end
  end
end
