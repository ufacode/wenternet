require 'rails_helper'

describe 'profiles pages', type: :feature do
  it 'is check users list in index page' do
    visit '/profiles'
    expect(page).to have_content 'Список пользователей'
  end

  it 'is check user info in show page' do
    @user = create(:user)
    visit profile_path(id: @user.id)
    expect(page).to have_content "#{@user.name}"
    expect(page).to have_content "#{@user.email}"
  end

  it 'is check user form in edit page' do
    @user = create(:user)
    visit edit_profile_path(id: @user.id)
    expect(page).to have_selector "input[name='user[name]']"
    expect(page).to have_selector "input[name='user[email]']"
    expect(page).to have_selector "input[value='#{@user.name}']"
    expect(page).to have_selector "input[value='#{@user.email}']"
  end
end
