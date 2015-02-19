FactoryGirl.define do
  factory :subcategory do
    name 'valid_name'
    uri 'valid_uri'
    category
  end
end
