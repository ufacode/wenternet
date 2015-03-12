FactoryGirl.define do
  factory :city do
    name { Faker::Address.city }
    sequence(:uri) { |i| "city#{i}" }
  end
end
