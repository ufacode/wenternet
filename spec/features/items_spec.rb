require "rails_helper"

describe "items index page", type: :feature do
  it "check item list" do
    visit items_path
    expect(page).to have_content "Listing Items"
    expect(page).to have_link "New Item"
  end
end
