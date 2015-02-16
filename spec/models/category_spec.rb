require 'rails_helper'

RSpec.describe Category, type: :model do

  let(:category) { FactoryGirl.create(:category) }

  it 'is valid factory for :category' do
    expect(FactoryGirl.create(:category)).to be_valid
  end
  it 'checks empty category name' do
    category = FactoryGirl.build(:category, name: nil)
    category.valid?
    expect(category.errors[:name]).to include("can't be blank")
  end
  it 'checks empty category name' do
    category = FactoryGirl.build(:category, uri: 's' * 65)
    category.valid?
    expect(category.errors[:uri]).to include('is too long (maximum is 64 characters)')
  end

  subject { category }

  it { should respond_to(:name) }
  it { should respond_to(:uri) }
  it { should be_valid }

  describe 'when name is empty' do
    before { category.name = '' }
    it { should be_invalid }
  end

  describe 'when uri is empty' do
    before { category.uri = '' }
    it { should be_invalid }
  end

end
