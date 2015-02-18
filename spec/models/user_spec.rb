require 'rails_helper'

RSpec.describe User, type: :model do

  it 'is check valid factory for :user' do
    valid_factory = create(:user)
    expect(valid_factory).to be_valid
  end

  it 'is check empty user name' do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is check user name limit with 255 chars' do
    user = build(:user, name: 's' * 256)
    user.valid?
    expect(user.errors[:name]).to include('is too long (maximum is 255 characters)')
  end

  it 'is check empty user email' do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is check unique value of user email' do
    create(:user, email: 'test@test.com')
    user = build(:user, email: 'test@test.com')
    user.valid?
    expect(user.errors['email']).to include('has already been taken')
  end

  it 'is check empty user password' do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'is check user password limit with 5 chars' do
    user = build(:user, password: 's' * 4)
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 5 characters)")
  end

  it "is check user password confirmation doesn't match" do
    user = build(:user, password: 'password', password_confirmation: 'another_password')
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end

end
