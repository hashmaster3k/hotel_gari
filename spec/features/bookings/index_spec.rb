# spec/features/bookings/index_spec.rb

require 'rails_helper'

RSpec.describe 'BOOKINGS INDEX PAGE' do
  before :each do
    @room_1 = Room.create!(image: 'carousel_3.jpg', beds: 1, price: 99.99, description: 'wow')
    @room_2 = Room.create!(image: 'carousel_3.jpg', beds: 1, price: 119.99, description: 'wow', river_view: true)
    @room_3 = Room.create!(image: 'carousel_6.jpg', beds: 2, price: 129.99, description: 'wow')
    @room_4 = Room.create!(image: 'carousel_6.jpg', beds: 2, price: 149.99, description: 'wow', river_view: true)
  end

  describe 'a visitor' do
    it 'has a valid link to bookings' do
      visit '/bookings'
    end

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

    it 'lists all current available rooms' do
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
  end
end
