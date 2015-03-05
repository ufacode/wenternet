require "rails_helper"

describe "items index page", type: :feature do
  it "check item list" do
    visit items_path
    expect(page).to have_content "Listing Items"
    expect(page).to have_link "New Item"
  end
end

describe "items list", type: :feature do
  before(:each) do
    @city = create(:city, name: "Ufa", uri: "ufa")
    @category = create(:category, name: "Auto", uri: "auto")
    @subcategory = create(:subcategory, name: "Sell", uri: "sell", category: @category)
    @item = create(:item, category: @category, subcategory: @subcategory, city: @city)
    @item.publish!
  end

  it "check items by city" do
    visit "/#{@city.uri}"
    expect(page).to have_content @category.name
    expect(page).to have_content @subcategory.name
    expect(page).to have_content @item.title
  end

  it "check items by all cities" do
    visit "/all"
    expect(page).to have_content @category.name
    expect(page).to have_content @subcategory.name
    expect(page).to have_content @item.title
  end

  it "check items by category" do
    visit "/#{@city.uri}/#{@category.uri}"
    expect(page).not_to have_content @category.name
    expect(page).to have_content @subcategory.name
    expect(page).to have_content @item.title
  end

  it "check items by subcategory" do
    visit "/#{@city.uri}/#{@category.uri}/#{@subcategory.uri}"
    expect(page).not_to have_content @category.name
    expect(page).not_to have_content @subcategory.name
    expect(page).to have_content @item.title
  end

  it "check item show page" do
    visit "/#{@city.uri}/#{@category.uri}/#{@subcategory.uri}/#{@item.id}"
    expect(page).to have_content @item.title
    expect(page).to have_content @category.name
    expect(page).to have_content @subcategory.name
  end
end
