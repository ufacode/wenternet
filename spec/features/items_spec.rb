require 'rails_helper'

describe 'items list', type: :feature do
  before(:each) do
    @city = create(:city, name: 'Ufa', uri: 'ufa')
    @category = create(:category, name: 'Auto', uri: 'auto')
    @subcategory = create(:subcategory, name: 'Sell', uri: 'sell', category: @category)
    @item = create(:item, category: @category, subcategory: @subcategory, city: @city)
    @item.publish!
  end

  it 'check items by city' do
    visit "/#{@city.uri}"
    expect(page).to have_content @category.name
    expect(page).to have_content @subcategory.name
    expect(page).to have_content @item.title
  end

  it 'check items by all cities' do
    visit '/all'
    expect(page).to have_content @category.name
    expect(page).to have_content @subcategory.name
    expect(page).to have_content @item.title
  end

  it 'check items by category' do
    visit "/#{@city.uri}/#{@category.uri}"
    expect(page).to have_content @category.name
    expect(page).to have_content @subcategory.name
    expect(page).to have_content @item.title
  end

  it 'check items by subcategory' do
    visit "/#{@city.uri}/#{@category.uri}/#{@subcategory.uri}"
    expect(page).to have_content @category.name
    expect(page).to have_content @subcategory.name
    expect(page).to have_content @item.title
  end

  it 'check item show page' do
    visit "/#{@city.uri}/#{@category.uri}/#{@subcategory.uri}/#{@item.id}"
    expect(page).to have_content @item.title
    expect(page).to have_content @category.name
    expect(page).to have_content @subcategory.name
  end
end

describe 'items pages with', type: :feature do
  context 'unauthorized user' do
    it 'is check index page' do
      visit items_path
      expect(page).to have_content('Listing Items')
      expect(page).not_to have_link('New Item')
      expect(page).not_to have_link('Edit')
      expect(page).not_to have_link('Destroy')
    end

    it 'is check item show page' do
      item = create(:item)
      visit item_path(item)
      expect(page).to have_content("#{item.title}")
      expect(page).not_to have_link('Редактировать объявление')
      expect(page).not_to have_link('+')
      expect(page).not_to have_link('-')
    end
  end

  context 'authorized user' do
    before(:each) do
      @user = create(:user, confirmed_at: Time.zone.now)
      @another_user = create(:user, confirmed_at: Time.zone.now)
      @user_item = create(:item, user: @user)
      @another_user_item = create(:item, user: @another_user)
      login_as(@user, scope: :user)
    end
    after(:each) { Warden.test_reset! }

    it 'is check index page' do
      visit items_path
      expect(page).to have_content('Listing Items')
      expect(page).to have_link('New Item')
      expect(page).to have_link('Edit', count: 1)
      expect(page).not_to have_link('Destroy')
    end

    it 'is check item show page' do
      visit item_path(@user_item)
      expect(page).to have_content("#{@user_item.title}")
      expect(page).to have_link('Редактировать объявление')
      expect(page).not_to have_link('+')
      expect(page).not_to have_link('-')
    end

    it 'is check item show page another user' do
      visit item_path(@another_user_item)
      expect(page).to have_content("#{@another_user_item.title}")
      expect(page).not_to have_link('Редактировать объявление')
      expect(page).to have_link('+')
      expect(page).to have_link('-')
    end

    it 'is check item edit page' do
      visit edit_item_path(@user_item)
      expect(page).to have_content('Editing Item')
      expect(page).to have_link('Back')
      expect(page).to have_link('Show')
    end

    it 'is check item edit page another user' do
      visit edit_item_path(@another_user_item)
      expect(page).to have_content('Быстрый поиск услуг, товаров, магазинов')
    end
  end

  context 'admin user' do
    before(:each) do
      @admin = create(:admin, confirmed_at: Time.zone.now)
      @user = create(:user, confirmed_at: Time.zone.now)
      @user_item = create(:item, user: @user)
      login_as(@admin, scope: :user)
    end
    after(:each) { Warden.test_reset! }

    it 'is check index page' do
      visit items_path
      expect(page).to have_content('Listing Items')
      expect(page).to have_link('New Item')
      expect(page).to have_link('Edit')
      expect(page).to have_link('Destroy')
    end

    it 'is check item show page' do
      item = create(:item, user: @admin)
      visit item_path(item)
      expect(page).not_to have_link('+')
      expect(page).not_to have_link('-')
    end

    it 'is check item show page another user' do
      visit item_path(@user_item)
      expect(page).to have_content("#{@user_item.title}")
      expect(page).to have_link('Редактировать объявление')
      expect(page).to have_link('+')
      expect(page).to have_link('-')
    end

    it 'is check item edit page' do
      visit edit_item_path(@user_item)
      expect(page).to have_content('Editing Item')
      expect(page).to have_link('Back')
      expect(page).to have_link('Show')
    end
  end
end
