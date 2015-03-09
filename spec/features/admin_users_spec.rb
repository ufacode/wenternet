require "rails_helper"

describe "users in admin", type: :feature do
  it "check users link in menu" do
    visit "/admin"
    expect(page).to have_content "Users"
  end
  it "check dashboard as unauthorization user" do
    visit admin_users_path
    expect(page).to have_content "Log in"
  end
end
