FactoryGirl.define do
  factory :user do
    name { Faker::Internet.user_name }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
    password_confirmation { password }
    role "user"

    factory :admin do
      role "admin"
    end
  end
end
