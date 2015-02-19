FactoryGirl.define do
  factory :user do
    name 'valid_name'
    email 'valid@email.com'
    password 'validpassowrd'
    password_confirmation 'validpassowrd'
  end
end
