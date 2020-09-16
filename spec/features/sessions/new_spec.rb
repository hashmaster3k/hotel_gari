# spec/features/sessions/new_spec.rb

require 'rails_helper'

RSpec.describe 'LOGIN PAGE' do
  before :each do
    @user = User.create!(username: 'jojames12@yahoo.com',
                password: 'testing123',
                first_name: 'Joe',
                last_name: 'James',
                address: '123 Fake St.',
                city: 'Denver',
                state: 'CO',
                zip: 80210)
  end

  it 'can login with valid credentials' do
    visit '/login'

    fill_in :username, with: @user.username
    fill_in :password, with: @user.password

    click_button 'Login'

    expect(current_path).to eq(user_profile_path)
    expect(page).to have_content("Welcome #{@user.first_name}")
    expect(page).to have_link('DASHBOARD', visible: false)
  end

  it 'cannot login with invalid credentials' do
    visit '/login'

    fill_in :username, with: @user.username
    fill_in :password, with: 'sodacan'

    click_button 'Login'

    expect(current_path).to eq('/login')
  end
end
