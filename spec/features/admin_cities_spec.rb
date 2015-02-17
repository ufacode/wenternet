require "rails_helper"

describe "cities in admin", :type => :feature do
  it "check cities link in menu" do
    visit "/admin"
    expect(page).to have_content 'Cities'
  end
  it "check dashboard" do
    visit admin_cities_path
    expect(page).to have_content 'Cities'
    expect(page).not_to have_link 'Show'
  end
end
