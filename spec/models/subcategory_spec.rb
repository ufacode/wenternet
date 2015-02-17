require 'rails_helper'

RSpec.describe Subcategory, type: :model do

  let(:subcategory) { create(:subcategory) }

  it 'is valid factory for subcategory' do
    expect(subcategory).to be_valid
    expect(subcategory.category.name).to eq 'valid_name'
  end

  it 'is check empty subcategory name' do
    subcategory = build(:subcategory, name: nil)
    subcategory.valid?
    expect(subcategory.errors[:name]).to include "can't be blank"
  end

  it 'is check subcategory name limit with 255 chars' do
    subcategory = build(:subcategory, name: 's' * 256)
    subcategory.valid?
    expect(subcategory.errors[:name]).to include 'is too long (maximum is 255 characters)'
  end

  it 'is check empty subcategory uri' do
    subcategory = build(:subcategory, uri: nil)
    subcategory.valid?
    expect(subcategory.errors[:uri]).to include "can't be blank"
  end

  it 'is check subcategory uri limit with 64 chars' do
    subcategory = build(:subcategory, uri: 's' * 65)
    subcategory.valid?
    expect(subcategory.errors[:uri]).to include 'is too long (maximum is 64 characters)'
  end

  it 'is check unique value of subcategory uri' do
    parent_category = create(:category)
    create(:subcategory, uri: 'pen', category: parent_category)
    subcategory = build(:subcategory, uri: 'pen', category: parent_category)
    subcategory.valid?
    expect(subcategory.errors[:uri]).to include 'has already been taken'
  end

  it 'is check existence of category' do
    subcategory = build(:subcategory, category: nil)
    subcategory.valid?
    expect(subcategory.errors[:category_id]).to include "can't be blank"
  end

end
