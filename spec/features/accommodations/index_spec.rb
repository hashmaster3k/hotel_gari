# spec/features/accommodations/index_spec.rb

require 'rails_helper'

RSpec.describe 'ACCOMMODATIONS INDEX PAGE'do
  it 'can visit accommodations page' do
    visit '/accommodations'
  end

  it 'displays hotel room statistics' do
    Room.create!(image: '1.jpg', beds: 1, price: 99.99, description: 'wow')
    Room.create!(image: '2.jpg', beds: 1, price: 119.99, description: 'wow', river_view: true)
    Room.create!(image: '3.jpg', beds: 2, price: 129.99, description: 'wow')
    Room.create!(image: '4.jpg', beds: 2, price: 149.99, description: 'wow', river_view: true)

    visit '/accommodations'

    expect(page).to have_content("Total number of villas: #{Room.total}")
    expect(page).to have_content("Total number of villas with river view: #{Room.total_with_view}")
    expect(page).to have_content("Numer of available villas: #{Room.total_available}")
    expect(page).to have_content("Number of available villas with river view: #{Room.total_available_with_view}")
    expect(page).to have_content("Average cost of villa: $#{Room.average_cost} per night")
  end
end
