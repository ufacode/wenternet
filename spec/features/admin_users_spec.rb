require 'rails_helper'

describe 'users in admin', type: :feature do
  it 'check users link in menu' do
    visit '/admin'
    expect(page).to have_content 'Users'
  end
  it 'check dashboard' do
    visit admin_users_path
    expect(page).to have_content 'Listing Users'
    expect(page).to have_content 'City'
    expect(page).not_to have_link 'Show'
  end
end
