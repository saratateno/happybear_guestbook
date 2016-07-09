require 'rails_helper'

RSpec.describe Entry, type: :model do
  it "gives an error message if name is not present" do
    expect(build(:entry, name: nil).errors_on(:name)).to include("Please enter a name")
  end

  it "gives an error message if message is not present" do
    expect(build(:entry, message: nil).errors_on(:message)).to include("Please enter a message")
  end
end
