require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }

  it 'is valid factory for :category' do
    expect(category).to be_valid
  end

  it 'is check empty category name' do
    category = build(:category, name: nil)
    category.valid?
    expect(category.errors[:name]).to include("can't be blank")
  end

  it 'is check category name limit with 255 chars' do
    category = build(:category, name: 's' * 256)
    category.valid?
    expect(category.errors[:name]).to include('is too long (maximum is 255 characters)')
  end

  it 'is check empty category uri' do
    category = build(:category, uri: nil)
    category.valid?
    expect(category.errors[:uri]).to include("can't be blank")
  end

  it 'is check category uri limit with 64 chars' do
    category = build(:category, uri: 's' * 65)
    category.valid?
    expect(category.errors[:uri]).to include('is too long (maximum is 64 characters)')
  end

  it 'is check uniq values of category uri' do
    create(:category, uri: 'cars')
    category = build(:category, uri: 'cars')
    category.valid?
    expect(category.errors[:uri]).to include('has already been taken')
  end

  it 'is check subcategory should be destroyed when category deleted' do
    parent_category = create(:category)
    create(:subcategory, category: parent_category)
    expect { parent_category.destroy }.to change(Subcategory, :count).by(-1)
  end
end
