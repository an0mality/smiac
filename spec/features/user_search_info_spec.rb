require 'rails_helper'

describe 'main/global_search.haml' do
  it 'correcting render' do
    visit root_path
    fill_in 'search', with: 'барс'
    click_button 'Найти'

    expect(page).to have_content 'Success'
  end
end