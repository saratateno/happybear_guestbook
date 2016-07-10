FactoryGirl.define do
  factory :entry do
    name { Faker::Name.name }
    message { Faker::Lorem.sentence }
  end

  factory :invalid_entry, parent: :entry do
    message nil
  end
end
