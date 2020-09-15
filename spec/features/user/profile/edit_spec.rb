# spec/features/user/profile/edit_spec.rb

require 'rails_helper'

RSpec.describe 'USER PROFILE EDIT PAGE' do
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
    it 'update their personal information except password' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit '/user/profile/edit'

      fill_in :user_username, with: 'user'
      fill_in :user_first_name, with: 'Joe'
      fill_in :user_last_name, with: 'James'
      fill_in :user_address, with: '123 Boulder Rd'
      fill_in :user_city, with: 'Boulder'
      fill_in :user_state, with: 'CO'
      fill_in :user_zip, with: 80102

      click_button "Update User"

      expect(current_path).to eq('/user/profile/info')
      expect(page).to have_content('Update information successfully')

      expect(page).to have_selector("input[value='#{@user.username}']")
      expect(page).to have_selector("input[value='#{@user.first_name}']")
      expect(page).to have_selector("input[value='#{@user.last_name}']")
      expect(page).to have_selector("input[value='123 Boulder Rd']")
      expect(page).to have_selector("input[value='Boulder']")
      expect(page).to have_selector("input[value='#{@user.state}']")
      expect(page).to have_selector("input[value='80102']")
    end

    it 'recives and error when leaving an blank field' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit '/user/profile/edit'

      fill_in :user_username, with: 'user'
      fill_in :user_first_name, with: 'Joe'
      fill_in :user_last_name, with: 'James'
      fill_in :user_address, with: ' '
      fill_in :user_city, with: 'Boulder'
      fill_in :user_state, with: 'CO'
      fill_in :user_zip, with: 80102

      click_button "Update User"

      expect(page).to have_content('Error: One or more fields was empty')

      expect(page).to have_selector("input[value='#{@user.username}']")
      expect(page).to have_selector("input[value='#{@user.first_name}']")
      expect(page).to have_selector("input[value='#{@user.last_name}']")
      expect(page).to have_selector("input[value='Boulder']")
      expect(page).to have_selector("input[value='#{@user.state}']")
      expect(page).to have_selector("input[value='80102']")
    end
  end

end
