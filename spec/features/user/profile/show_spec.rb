# spec/features/user/profile/show_spec.rb

require 'rails_helper'

RSpec.describe 'USER PROFILE SHOW PAGE' do
  before :each do
    @user = User.create!(username: 'user',
                password: '123',
                first_name: 'Joe',
                last_name: 'James',
                address: '1382 JJ Drive',
                city: 'Denver',
                state: 'CO',
                zip: 80210)
  end

  describe 'a visitor' do
    it 'cannot visit the profile page' do
      visit '/user/profile'
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

  describe 'a user' do
    it 'can view its profile page' do
      visit '/login'

      fill_in :username, with: @user.username
      fill_in :password, with: @user.password

      click_button 'Login'

      expect(current_path).to eq('/user/profile')
      expect(page).to have_link('DASHBOARD', visible: false)

      expect(page).to have_content("Welcome #{@user.first_name}!")
      expect(page).to have_link("Overview")
      expect(page).to have_link("Activities")
      expect(page).to have_link("Billing")
      expect(page).to have_link("Profile")
    end
  end

end
