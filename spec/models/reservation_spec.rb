# spec/models/reservation_spec.rb

require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do
    it {should validate_presence_of :check_in }
    it {should validate_presence_of :check_out }
    it {should validate_presence_of :adults }
    it {should validate_presence_of :children }
    it {should validate_presence_of :status }
  end

  describe 'relationships' do
    it { should belong_to :room }
    it { should belong_to :user }
  end

  it 'can create a reservation' do
    room = Room.create!(image: '1.jpg', beds: 1, price: 99.99, description: 'Wow')

    user = User.create!(username: 'user',
                        password: '123',
                        first_name: 'Joe',
                        last_name: 'James',
                        address: '1382 JJ Drive',
                        city: 'Denver',
                        state: 'CO',
                        zip: 80210)

    user.reservations.create!(room_id: room.id,
                              check_in: Date.today,
                              check_out: Date.today,
                              adults: 1,
                              children: 0)

    expect(Reservation.count).to eq(1)
  end
end
