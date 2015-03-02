require "rails_helper"

describe "search page", type: :feature do
  before(:each) { visit search_index_path }

  it "check search form" do
    expect(page).to have_selector "input[name='search[query]']"
    expect(page).to have_button "Search"
    expect(page).not_to have_selector "table"
  end

  it "check search working" do
    click_button "Search"
    expect(page).to have_selector "table"
    expect(page).to have_content "Title"
    expect(page).to have_content "Price"
  end
end
