# spec/features/sessions/show_spec.rb

require 'rails_helper'

RSpec.describe 'USER SHOW PAGE' do
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

  it 'can log out' do
    visit '/login'

    fill_in :username, with: @user.username
    fill_in :password, with: @user.password

    click_button 'Login'

    expect(current_path).to eq('/profile')
    expect(page).to have_link('DASHBOARD', visible: false)

    click_button 'LOG OUT'

    expect(current_path).to eq('/')
    expect(page).to have_link('LOGIN', visible: false)
  end
end
