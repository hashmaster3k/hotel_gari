# spec/features/user/billing/show_spec.rb

require 'rails_helper'

RSpec.describe 'BILLING SHOW PAGE' do
  before :each do
    @room_1 = Room.create!(image: 'carousel_3.jpg', beds: 1, price: 99.99, description: 'wow')
    @room_2 = Room.create!(image: 'carousel_3.jpg', beds: 1, price: 119.99, description: 'wow', river_view: true)

    @user = User.create!(username: 'user',
                        password: '123',
                        first_name: 'Joe',
                        last_name: 'James',
                        address: '1382 JJ Drive',
                        city: 'Denver',
                        state: 'CO',
                        zip: 80210)

    @res_1 = @user.reservations.create!(room_id: @room_1.id,
                        check_in: Date.today,
                        check_out: Date.today,
                        guests: 1)

    @res_2 = @user.reservations.create!(room_id: @room_2.id,
                        check_in: Date.today,
                        check_out: Date.today,
                        guests: 1)

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
  end
end
