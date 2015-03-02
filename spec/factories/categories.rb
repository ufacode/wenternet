FactoryGirl.define do
  factory :category do
    name { Faker::Lorem.word }
    uri { Faker::Lorem.word }
  end
end
