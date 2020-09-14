# spec/features/users/new_spec.rb

require 'rails_helper'

RSpec.describe 'USERS NEW PAGE' do
  it 'can create a new user' do
    visit '/users/new'

    fill_in :username, with: 'jojames12@yahoo.com'
    fill_in :password, with: 'testing123'
    fill_in :first_name, with: 'Joe'
    fill_in :last_name, with: 'James'
    fill_in :address, with: '123 Fake St.'
    fill_in :city, with: 'Denver'
    fill_in :state, with: 'CO'
    fill_in :zip, with: 80210

    click_button "Create Account"

    expect(current_path).to eq(user_profile_path)
    expect(page).to have_content('Welcome Joe!')
  end
end
