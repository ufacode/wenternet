require "rails_helper"

describe "subcategories in admin", type: :feature do
  it "check subcategories link in menu" do
    visit "/admin"
    expect(page).to have_content "Subcategories"
  end
  it "check dashboard" do
    visit admin_subcategories_path
    expect(page).to have_content "Listing Subcategories"
    expect(page).to have_link "New Subcategory"
    expect(page).not_to have_link "Show"
  end
end
