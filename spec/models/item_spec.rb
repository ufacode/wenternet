require "rails_helper"

RSpec.describe Item, type: :model do
  it "is check valid factory for :item" do
    valid_factory = build(:item)
    expect(valid_factory).to be_valid
  end

  it "is check empty item title" do
    item = build(:item, title: nil)
    item.valid?
    expect(item.errors[:title]).to include("can't be blank")
  end

  it "is check item title limit with 255 chars" do
    item = build(:item, title: "s" * 256)
    item.valid?
    expect(item.errors[:title]).to include("is too long (maximum is 255 characters)")
  end

  it "is check item price is decimal" do
    item = build(:item, price: "str")
    item.valid?
    expect(item.errors[:price]).to include("is not a number")
  end

  it "is check item price greater or equal 1" do
    item = build(:item, price: 0)
    item.valid?
    expect(item.errors[:price]).to include("must be greater than or equal to 1")
    item.price = 1
    expect(item).to be_valid
  end

  it "is check item price can be nil" do
    item = build(:item, price: nil)
    expect(item).to be_valid
  end

  it "is check existence of category" do
    item = build(:item, category: nil)
    item.valid?
    expect(item.errors[:category_id]).to include "can't be blank"
  end

  it "is check existence of subcategory" do
    item = build(:item, subcategory: nil, category: build(:category))
    item.valid?
    expect(item.errors[:subcategory_id]).to include "can't be blank"
  end

  it "is check existence of city" do
    item = build(:item, city: nil)
    item.valid?
    expect(item.errors[:city_id]).to include "can't be blank"
  end

  it "is check existence of user" do
    item = build(:item, user: nil)
    item.valid?
    expect(item.errors[:user_id]).to include "can't be blank"
  end

  it "is check empty item email" do
    item = build(:item, email: nil)
    item.valid?
    expect(item.errors[:email]).to include("can't be blank")
  end

  it "is check empty item phone" do
    item = build(:item, phone: nil)
    item.valid?
    expect(item.errors[:phone]).to include("can't be blank")
  end

  it "is check images should be destroyed when item deleted" do
    item = create(:item)
    create(:image, item: item)
    create(:image, item: item)
    expect { item.destroy }.to change(Image, :count).by(-2)
  end

  it "is check initial item state" do
    item = create(:item)
    expect(item.state).to eq "drafted"
  end

  it "is check item state after publishing" do
    item = create(:item)
    item.publish!
    expect(item.state).to eq "published"
  end

  it "is check item state after draft" do
    item = create(:item, state: "published")
    expect(item).to be_published
    item.draft!
    expect(item.state).to eq "drafted"
  end
end
