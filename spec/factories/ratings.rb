FactoryGirl.define do
  factory :plus_rating, class: 'Rating' do
    association :item,  factory: :item
    user { item.user }
    association :voter, factory: :user
    rating 1

    factory :minus_rating, class: 'Rating' do
      rating { -1 }
    end
  end
end
