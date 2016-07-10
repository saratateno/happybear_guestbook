require 'rails_helper'

RSpec.describe Entry, type: :model do
  it 'gives an error message if name is not present' do
    expect(build(:entry, name: nil).errors_on(:name)).to include('is required.')
  end

  it 'gives an error message if message is not present' do
    expect(build(:invalid_entry).errors_on(:message)).to include('is required.')
  end

  it 'does not save an invalid entry to the database' do
    expect { build(:entry, name: nil) }.not_to change { Entry.count }
    expect { build(:entry, message: nil) }.not_to change { Entry.count }
  end
end
