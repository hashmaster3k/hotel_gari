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
        click_button "BOOK"
      end

      expect(current_path).to eq("/user/bookings/new.#{@room_1.id}")
    end
  end
end
