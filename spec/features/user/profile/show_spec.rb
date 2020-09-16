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

  describe 'a user' do
    it 'will see all their information with links to update their infromation or password' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit '/user/profile/info'

      within '.profile-content' do
        expect(page).to have_selector("input[value='#{@user.username}']")
        expect(page).to have_selector("input[value='#{@user.first_name}']")
        expect(page).to have_selector("input[value='#{@user.last_name}']")
        expect(page).to have_selector("input[value='#{@user.address}']")
        expect(page).to have_selector("input[value='#{@user.city}']")
        expect(page).to have_selector("input[value='#{@user.state}']")
        expect(page).to have_selector("input[value='#{@user.zip}']")
        expect(page). to have_link("Update Personal Information")
        expect(page). to have_link("Update Password")
      end
    end
  end

end
