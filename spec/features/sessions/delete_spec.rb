# spec/features/sessions/delete_spec.rb

require 'rails_helper'

RSpec.describe 'USER SHOW PAGE' do
  before :each do
    @admin = User.create(role: 1,
                        username: 'admin',
                        password: '123',
                        first_name: 'Rick',
                        last_name: 'Steves',
                        address: '1322 Admin Rd',
                        city: 'Denver',
                        state: 'CO',
                        zip: 80210)

    @user = User.create!(username: 'user',
                        password: '123',
                        first_name: 'Joe',
                        last_name: 'James',
                        address: '1382 JJ Drive',
                        city: 'Denver',
                        state: 'CO',
                        zip: 80210)
  end

  it 'can log out' do
    visit '/login'

    fill_in :username, with: @user.username
    fill_in :password, with: @user.password

    click_button 'Login'

    expect(current_path).to eq(user_profile_path)
    expect(page).to have_link('DASHBOARD', visible: false)

    click_button 'LOG OUT'

    expect(current_path).to eq('/')
    expect(page).to have_link('LOGIN', visible: false)
  end
end
