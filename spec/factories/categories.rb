FactoryGirl.define do
  factory :category do
    name { Faker::Lorem.word }
    sequence(:uri) { |i| "category#{i}" }
  end
end
