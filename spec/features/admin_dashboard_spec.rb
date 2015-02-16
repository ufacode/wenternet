require "rails_helper"

describe "menu and dashboard on 1st admin page", :type => :feature do
  it "check menu" do
    visit "/admin"
    expect(page).to have_content 'Menu'
  end
  it "check dashboard" do
    visit "/admin"
    expect(page).to have_content 'Dashboard'
  end
end
