require "rails_helper"

RSpec.describe Rating, type: :model do
  it "is check valid factory :plus_rating" do
    rating = create(:plus_rating)
    expect(rating).to be_valid
  end

  it "is check valid factory :minus_rating" do
    rating = create(:minus_rating)
    expect(rating).to be_valid
  end

  it "is check empty user" do
    rating = build(:plus_rating, user: nil)
    rating.valid?
    expect(rating.errors["user_id"]).to include("can't be blank")
  end

  it "is check empty voter" do
    rating = build(:plus_rating, voter: nil)
    rating.valid?
    expect(rating.errors["voter_id"]).to include("can't be blank")
  end

  it "is check empty item" do
    rating = build(:plus_rating, item: nil, user: nil)
    rating.valid?
    expect(rating.errors["item_id"]).to include("can't be blank")
  end

  it "is check empty rating" do
    rating = build(:plus_rating, rating: nil)
    rating.valid?
    expect(rating.errors["rating"]).to include("can't be blank")
  end

  it "is check uniqueness item+voter" do
    item = create(:item)
    voter = create(:user)
    create(:plus_rating, item: item, voter: voter)
    another_rating = build(:plus_rating, item: item, voter: voter)
    another_rating.valid?
    expect(another_rating.errors["voter_id"]).to include("has already voted")
  end

  it "is check that one user can vote for multiple items" do
    voter = create(:user)
    create(:plus_rating, voter: voter)
    another_rating = build(:plus_rating, voter: voter)
    expect(another_rating).to be_valid
  end
end
