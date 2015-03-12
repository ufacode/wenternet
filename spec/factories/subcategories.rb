FactoryGirl.define do
  factory :subcategory do
    name { Faker::Lorem.word }
    sequence(:uri) { |i| "subcategory#{i}" }
    association :category, factory: :category
  end
end
