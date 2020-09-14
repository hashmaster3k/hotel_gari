# spec/features/users/new_spec.rb

require 'rails_helper'

RSpec.describe 'USERS NEW PAGE' do
  it 'can create a new user' do
    visit '/users/new'

    fill_in :user_username, with: 'jojames12@yahoo.com'
    fill_in :user_password, with: 'testing123'
    fill_in :user_first_name, with: 'Joe'
    fill_in :user_last_name, with: 'James'
    fill_in :user_address, with: '123 Fake St.'
    fill_in :user_city, with: 'Denver'
    fill_in :user_state, with: 'CO'
    fill_in :user_zip, with: 80210

    click_button "Create User"

    expect(current_path).to eq(user_profile_path)
    expect(page).to have_content('Welcome Joe!')
  end

  it 'gets a flash error when submitting with an empty field and maintains pre-filled fields' do
    visit '/users/new'

    fill_in :user_username, with: 'jojames12@yahoo.com'
    fill_in :user_password, with: 'testing123'
    fill_in :user_first_name, with: 'Joe'
    fill_in :user_last_name, with: 'James'
    fill_in :user_address, with: ' '
    fill_in :user_city, with: 'Denver'
    fill_in :user_state, with: 'CO'
    fill_in :user_zip, with: 80210

    click_button "Create User"

    expect(page).to have_content('Error: One or more fields was empty')
    expect(page).to have_selector("input[value='jojames12@yahoo.com']")
    expect(page).to have_selector("input[value='Joe']")
    expect(page).to have_selector("input[value='James']")
    expect(page).to have_selector("input[value='Denver']")
    expect(page).to have_selector("input[value='CO']")
    expect(page).to have_selector("input[value='80210']")
  end
end
