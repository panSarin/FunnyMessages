require_relative 'features_helper'

feature 'As an guest,
  I want to provide my nickname, and select dialect' do

  scenario 'Filling all required data and clicking "let me chat"' do
    visit root_path
    fill_in 'Name', with: 'Joe'
    select 'Pirate', from: 'Dialect'
    click_on 'Let me chat'
    expect(page).to have_content('Messages')
  end

  scenario 'Clicking "let me chat" without fillin all required data' do
    visit root_path
    select 'Pirate', from: 'Dialect'
    click_on 'Let me chat'
    expect(page).to have_content('can\'t be blank')
  end

end
