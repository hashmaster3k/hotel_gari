# spec/models/room_spec.rb

require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'validations' do
    it {should validate_presence_of :beds }
    it {should validate_presence_of :price }
  end

  it 'can create rooms' do
    Room.create!(beds: 1, price: 32.99)
    expect(Room.count).to eq(1)

    room = Room.create!(beds: 1, price: 32.99, river_view: true, is_rented: true)
    expect(Room.count).to eq(2)
    expect(room.river_view).to eq(true)
  end

  it 'cant create room without necessary fields' do
    Room.create(price: 32.99)
    expect(Room.count).to eq(0)
  end
end
