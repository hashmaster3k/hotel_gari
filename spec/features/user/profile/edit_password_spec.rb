# spec/features/user/profile/edit_password_spec.rb

require 'rails_helper'

RSpec.describe 'USER PROFILE EDIT PASSWORD PAGE' do
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
    it 'can change their password' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit '/user/profile/info'

      click_link 'Update Password'

      expect(current_path).to eq('/user/profile/password')

      fill_in :password, with: 'jojames12@yahoo.com'

      click_button "Update Password"

      expect(current_path).to eq('/user/profile/info')
      expect(page). to have_content("Password successfully changed")
    end
  end
end
