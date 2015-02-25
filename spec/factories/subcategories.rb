FactoryGirl.define do
  factory :subcategory do
    name { Faker::Lorem.word }
    uri { Faker::Lorem.word }
    association :category, factory: :category
  end
end
