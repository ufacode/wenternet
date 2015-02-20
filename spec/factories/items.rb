FactoryGirl.define do
  factory :item do
    title 'valid_title'
    price 9.1
    content 'valid_content'
    subcategory
    category { subcategory.category }
    city
    email 'valid@email.ru'
    phone '9871111111'
  end
end
