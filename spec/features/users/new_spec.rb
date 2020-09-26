# spec/features/users/new_spec.rb

require 'rails_helper'

RSpec.describe 'USERS NEW PAGE' do
  it 'can create a new user' do
    visit '/users/new'

    fill_in :user_username, with: 'jojames12@yahoo.com'
    fill_in :user_password, with: 'testing123'
    fill_in :user_first_name, with: 'Joe'
    fill_in :user_last_name, with: 'James'
    fill_in :user_phone, with: '555-123-4567'
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
    fill_in :user_phone, with: '555-123-4567'
    fill_in :user_address, with: ' '
    fill_in :user_city, with: 'Denver'
    fill_in :user_state, with: 'CO'
    fill_in :user_zip, with: 80210

    click_button "Create User"

    expect(page).to have_content("Address can't be blank")
    expect(page).to have_selector("input[value='jojames12@yahoo.com']")
    expect(page).to have_selector("input[value='Joe']")
    expect(page).to have_selector("input[value='James']")
    expect(page).to have_selector("input[value='Denver']")
    expect(page).to have_selector("input[value='CO']")
    expect(page).to have_selector("input[value='80210']")
  end

  it 'cannot create an account using an existing username/email' do
    User.create!(username: 'jojames12@yahoo.com',
                password: '123',
                first_name: 'Johnny',
                last_name: 'Justice',
                phone: '555-123-4567',
                address: '123 JJ Street',
                city: 'LA',
                state: 'CO',
                zip: 90210)

    visit '/users/new'

    fill_in :user_first_name, with: 'Joe'
    fill_in :user_last_name, with: 'James'
    fill_in :user_phone, with: '555-123-4567'
    fill_in :user_address, with: '123 Fake St.'
    fill_in :user_city, with: 'Denver'
    fill_in :user_state, with: 'CO'
    fill_in :user_zip, with: 80210
    fill_in :user_username, with: 'jojames12@yahoo.com'
    fill_in :user_password, with: 'testing123'

    click_button "Create User"

    expect(page).to have_content("Username has already been taken")

  end
end
