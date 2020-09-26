# spec/features/user/billing/show_spec.rb

require 'rails_helper'

RSpec.describe 'BILLING SHOW PAGE' do
  before :each do
    @room_1 = Room.create!(image: 'carousel_3.jpg', beds: 1, price: 99.99, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')

    @user = User.create!(username: 'user',
                        password: '123',
                        first_name: 'Joe',
                        last_name: 'James',
                        phone: '123-456-7890',
                        address: '1382 JJ Drive',
                        city: 'Denver',
                        state: 'CO',
                        zip: 80210)

    @res_1 = @user.reservations.create!(room_id: @room_1.id,
                        check_in: Date.today,
                        check_out: Date.tomorrow,
                        guests: 1,
                        total_cost: 99.99)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'a user' do
    it 'can visit a reservation page' do
      visit '/user/billing'

      within "#reservation-#{@res_1.id}" do
        click_link "VIEW"
      end

      expect(current_path).to eq("/user/billing/#{@res_1.id}")
    end

    it 'has all information about reservation' do
      visit "/user/billing/#{@res_1.id}"

      expect(page).to have_content("Villa ##{@room_1.id}")
      expect(page).to have_xpath("//img['#{@room_1.image}']")
      expect(page).to have_content(@room_1.description)
      expect(page).to have_content("Number of beds: #{@room_1.beds}")
      expect(page).to have_content("Has river view? No")
      expect(page).to have_content("Check-in: #{Date.today}")
      expect(page).to have_content("Check-out: #{Date.tomorrow}")
      expect(page).to have_content("Price: $#{@room_1.price} per night")
      expect(page).to have_content("Total: $#{@room_1.price * 1}")
    end
  end
end
