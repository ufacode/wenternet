require "rails_helper"

describe "search page", type: :feature do
  before(:each) { visit search_index_path }

  it "check search form" do
    expect(page).to have_selector "input[name='search[query]']"
    expect(page).to have_button "Поиск"
  end

  it "check search working" do
    click_button "Поиск"
    expect(page).to have_selector "input[name='search[query]']"
    expect(page).to have_content "По запросу найдено"
  end
end
