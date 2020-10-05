# spec/models/room_spec.rb

require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'validations' do
    it {should validate_presence_of :beds }
    it {should validate_presence_of :price }
    it {should validate_presence_of :image }
    it {should validate_presence_of :description }
  end

  describe 'relationships' do
    it { should have_many :reservations }
  end

  before :each do
    Room.create!(image: '1.jpg', beds: 1, price: 99.99, description: 'Wow')
    Room.create!(image: '2.jpg', beds: 1, price: 119.99, description: 'Wee', river_view: true)
  end

  it 'can create rooms' do
    expect(Room.count).to eq(2)
  end

  it 'cant create room without necessary fields' do
    Room.create(price: 32.99)
    expect(Room.count).to eq(2)
  end

  it 'can count total number of rooms' do
    expect(Room.total).to eq(2)
  end

  it 'can count total number of rooms with view' do
    expect(Room.total_with_view).to eq(1)
  end

  it 'can count total number of available rooms' do
    expect(Room.total_available).to eq(2)
  end

  it 'can count total number of available rooms with view' do
    expect(Room.total_available_with_view).to eq(1)
  end

  it 'can calculate average room cost' do
    expect(Room.average_cost).to eq(109.99)
  end
end
