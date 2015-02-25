FactoryGirl.define do
  factory :city do
    name { Faker::Address.city }
    uri { Faker::Lorem.word }
  end
end
