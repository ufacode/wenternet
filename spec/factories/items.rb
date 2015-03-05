FactoryGirl.define do
  factory :item do
    title { Faker::Name.title }
    price { rand(1..10_000).round(2) }
    content { Faker::Lorem.sentence(6) }
    association :subcategory, factory: :subcategory
    category { subcategory.category }
    association :city, factory: :city
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
  end
end
