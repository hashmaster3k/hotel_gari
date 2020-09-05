# spec/features/amenities/index_spec.rb

require 'rails_helper'

RSpec.describe 'AMENITIES INDEX PAGE' do
  it 'can visit amenities page' do
    visit '/amenities'
  end

  it 'has amenities and activities listed' do
    visit '/amenities'

    expect(page).to have_content('Yoga')
    expect(page).to have_content('Gym')
    expect(page).to have_content('Massage')
    expect(page).to have_content('Plunge Pool')
    expect(page).to have_content('River Rafting')
    expect(page).to have_content('Field Riding')
    expect(page).to have_content('Taste School')
  end
end
