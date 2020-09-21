# spec/features/bookings/index_spec.rb

require 'rails_helper'

RSpec.describe 'BOOKINGS INDEX PAGE' do
  before :each do
    @room_1 = Room.create!(image: 'carousel_3.jpg', beds: 1, price: 99.99, description: 'wow')
    @room_2 = Room.create!(image: 'carousel_3.jpg', beds: 1, price: 119.99, description: 'wow', river_view: true)
    @room_3 = Room.create!(image: 'carousel_6.jpg', beds: 2, price: 129.99, description: 'wow')
    @room_4 = Room.create!(image: 'carousel_6.jpg', beds: 2, price: 149.99, description: 'wow', river_view: true)

    @user = User.create!(username: 'user',
                        password: '123',
                        first_name: 'Joe',
                        last_name: 'James',
                        address: '1382 JJ Drive',
                        city: 'Denver',
                        state: 'CO',
                        zip: 80210)

    @reservation_1 = @user.reservations.create!(room_id: @room_1.id,
                                                check_in: Date.new(2020, 12, 1),
                                                check_out: Date.new(2020, 12, 5),
                                                adults: 1,
                                                children: 0)

    @reservation_2 = @user.reservations.create!(room_id: @room_3.id,
                                                check_in: Date.new(2020, 12, 23),
                                                check_out: Date.new(2020, 12, 26),
                                                adults: 1,
                                                children: 0)
  end

  describe 'a visitor' do
    it 'has a valid link to bookings' do
      visit '/bookings'
    end

    it 'cannot book without being logged in or registered' do
      visit '/bookings'

      within "#room-#{@room_1.id}" do
        click_button "BOOK"
      end

      expect(current_path).to eq('/bookings')
      expect(page).to have_content('You must be logged in or register to continue')
    end
  end

  describe 'search function' do
    it 'has a search box for booking' do
      visit '/bookings'

      within '.search-box-booking'do
        expect(page).to have_content('Check-in')
        expect(page).to have_content('Check-out')
        expect(page).to have_content('Adults')
        expect(page).to have_content('Children')
        expect(page).to have_button('FIND VILLA')
      end
    end

    it 'lists all current available rooms by default' do
      visit '/bookings'

      within "#room-#{@room_1.id}" do
        expect(page).to have_xpath("//img['#{@room_1.image}']")
        expect(page).to have_content("#{@room_1.beds} Bed Villa")
        expect(page).to have_content(@room_1.description)
        expect(page).to have_content(@room_1.price)
        expect(page).to have_button("BOOK")
      end

      within "#room-#{@room_2.id}" do
        expect(page).to have_xpath("//img['#{@room_2.image}']")
        expect(page).to have_content("#{@room_2.beds} Bed Villa | River View")
        expect(page).to have_content(@room_1.description)
        expect(page).to have_content(@room_2.price)
        expect(page).to have_button("BOOK")
      end

      within "#room-#{@room_3.id}" do
        expect(page).to have_xpath("//img['#{@room_3.image}']")
        expect(page).to have_content("#{@room_3.beds} Bed Villa")
        expect(page).to have_content(@room_1.description)
        expect(page).to have_content(@room_3.price)
        expect(page).to have_button("BOOK")
      end

      within "#room-#{@room_4.id}" do
        expect(page).to have_xpath("//img['#{@room_4.image}']")
        expect(page).to have_content("#{@room_3.beds} Bed Villa | River View")
        expect(page).to have_content(@room_1.description)
        expect(page).to have_content("$#{@room_4.price}")
        expect(page).to have_button("BOOK")
      end
    end

    it 'displays only available rooms when searching through specific dates' do
      visit '/bookings'

      fill_in 'Check-in', with: '2020-12-03'
      fill_in 'Check-out', with: '2020-12-06'
      select 'No', from: :river_view
      click_button "FIND VILLA"

      expect(current_path).to eq('/bookings')

      within "#room-#{@room_3.id}" do
        expect(page).to have_xpath("//img['#{@room_3.image}']")
        expect(page).to have_content("#{@room_3.beds} Bed Villa")
        expect(page).to have_content(@room_1.description)
        expect(page).to have_content(@room_3.price)
        expect(page).to have_button("BOOK")
      end

      expect(page).to_not have_css("#room-#{@room_1.id}") # room is taken during that date range
      expect(page).to_not have_css("#room-#{@room_2.id}") # has river view
      expect(page).to_not have_css("#room-#{@room_4.id}") # has river view
    end
  end
end
