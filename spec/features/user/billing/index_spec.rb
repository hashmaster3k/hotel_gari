# spec/features/user/billing/index_spec.rb

require 'rails_helper'

RSpec.describe 'BILLING INDEX PAGE' do
  before :each do
    @room_1 = Room.create!(image: 'carousel_3.jpg', beds: 1, price: 99.99, description: 'wow')
    @room_2 = Room.create!(image: 'carousel_3.jpg', beds: 1, price: 119.99, description: 'wow', river_view: true)

    @user = User.create!(username: 'user',
                        password: '123',
                        first_name: 'Joe',
                        last_name: 'James',
                        phone: '555-123-4567',
                        address: '1382 JJ Drive',
                        city: 'Denver',
                        state: 'CO',
                        zip: 80210)

    @res_1 = @user.reservations.create!(room_id: @room_1.id,
                        check_in: Date.today,
                        check_out: Date.today,
                        guests: 1,
                        total_cost: @room_1.price * 1)

    @res_2 = @user.reservations.create!(room_id: @room_2.id,
                        check_in: Date.today,
                        check_out: Date.today,
                        guests: 1,
                        total_cost: @room_1.price * 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'a user' do
    it 'sees all their reservations, status and a link to each reservation' do
      visit '/user/billing'

      within "#reservation-#{@res_1.id}" do
        expect(page).to have_content("Reservation ##{@res_1.id} - #{@res_1.status}")
        expect(page).to have_link("VIEW")
      end

      within "#reservation-#{@res_2.id}" do
        expect(page).to have_content("Reservation ##{@res_2.id} - #{@res_1.status}")
        expect(page).to have_link("VIEW")
      end
    end
  end
end
