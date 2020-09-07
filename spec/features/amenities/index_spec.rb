# spec/features/amenities/index_spec.rb

require 'rails_helper'

RSpec.describe 'AMENITIES INDEX PAGE' do
  it 'can visit amenities page' do
    visit '/amenities'
  end

  it 'has amenities and activities listed' do
    yoga = Activity.create!(name: 'Yoga',
                    description: 'core strength',
                    capacity: 5,
                    start_times: ['7:00', '9:00', '11:00'],
                    image: 'amen_1.jpg')
    gym = Activity.create!(name: 'Gym',
                    description: 'core strength',
                    capacity: 5,
                    start_times: ['7:00', '9:00', '11:00'],
                    image: 'amen_2.jpg')

    visit '/amenities'

    expect(page).to have_content(yoga.name)
    expect(page).to have_xpath("//img['#{yoga.image}']")
    expect(page).to have_content(gym.name)
    expect(page).to have_xpath("//img['#{gym.image}']")
  end
end
