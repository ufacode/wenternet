require 'rails_helper'

describe 'search form on main page', type: :feature do
  it 'input for search and button exist' do
    visit '/'
    expect(page).to have_button 'Искать'
    expect(page).to have_selector "input[name='search[query]']"
  end
end
