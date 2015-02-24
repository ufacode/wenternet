require "rails_helper"

describe "categories in admin", type: :feature do
  it "check categories link in menu" do
    visit "/admin"
    expect(page).to have_content "Categories"
  end
  it "check dashboard" do
    visit admin_categories_path
    expect(page).to have_content "Categories"
    expect(page).not_to have_link "Show"
  end
end
