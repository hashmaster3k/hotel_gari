# spec/features/user/bookings/new_spec.rb

require 'rails_helper'

RSpec.describe 'BOOKINGS NEW PAGE' do
  before :each do
    @room_1 = Room.create!(image: 'carousel_3.jpg', beds: 1, price: 99.99, description: 'wow')
    @room_2 = Room.create!(image: 'carousel_3.jpg', beds: 1, price: 119.99, description: 'wow', river_view: true)
    @room_3 = Room.create!(image: 'carousel_6.jpg', beds: 2, price: 129.99, description: 'wow')
    @room_4 = Room.create!(image: 'carousel_6.jpg', beds: 2, price: 149.99, description: 'wow', river_view: true)
    @room_5 = Room.create!(image: 'carousel_6.jpg', beds: 2, price: 149.99, description: 'wow', river_view: true)

    @user = User.create!(username: 'user',
                        password: '123',
                        first_name: 'Joe',
                        last_name: 'James',
                        address: '1382 JJ Drive',
                        city: 'Denver',
                        state: 'CO',
                        zip: 80210)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'a user' do
    it 'can create a new booking' do
      visit '/bookings'

      fill_in 'Check-in', with: Date.today
      fill_in 'Check-out', with: Date.tomorrow
      select 'No', from: :river_view
      click_button "FIND VILLA"

      within "#room-#{@room_1.id}" do
        click_link "BOOK"
      end

      expect(current_path).to eq("/user/bookings/new")

      within '.booking-confirm' do
        expect(page).to have_content("Confirm Booking")
        expect(page).to have_content("Villa ##{@room_1.id}")
        expect(page).to have_content("Check-in: #{Date.today.strftime("%m-%d-%Y")}")
        expect(page).to have_content("Check-out: #{Date.tomorrow.strftime("%m-%d-%Y")}")
        expect(page).to have_content("Total nights: 1")
        expect(page).to have_content("Price per night: $#{@room_1.price}")
        expect(page).to have_content("Total cost: $#{@room_1.price * 1}")
        click_button "CONFIRM"
      end

      expect(current_path).to eq('/user/billing')

      within "#reservation-#{Reservation.last.id}" do
        expect(page).to have_content("Reservation ##{Reservation.last.id}")
        expect(page).to have_link("VIEW")
      end
    end
  end
end
