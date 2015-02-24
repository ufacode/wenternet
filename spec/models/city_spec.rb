require "rails_helper"

RSpec.describe City, type: :model do
  let(:city) { create(:city) }

  it "is valid factory for :city" do
    expect(city).to be_valid
  end

  it "is check empty city name" do
    city = build(:city, name: nil)
    city.valid?
    expect(city.errors[:name]).to include("can't be blank")
  end

  it "is check city name limit with 255 chars" do
    city = build(:city, name: "s" * 256)
    city.valid?
    expect(city.errors[:name]).to include("is too long (maximum is 255 characters)")
  end

  it "is check empty city uri" do
    city = build(:city, uri: nil)
    city.valid?
    expect(city.errors[:uri]).to include("can't be blank")
  end

  it "is check city uri limit with 64 chars" do
    city = build(:city, uri: "s" * 65)
    city.valid?
    expect(city.errors[:uri]).to include("is too long (maximum is 64 characters)")
  end

  it "is check uniq values of city uri" do
    create(:city, uri: "Ufa")
    city = build(:city, uri: "Ufa")
    city.valid?
    expect(city.errors[:uri]).to include("has already been taken")
  end
end
