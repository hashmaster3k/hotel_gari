# spec/models/activity_spec.rb

require 'rails_helper'

RSpec.describe Activity do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :capacity }
    it { should validate_presence_of :start_times }
    it { should validate_presence_of :image }
  end

  it 'can create activities' do
    Activity.create!(name: 'Yoga',
                    description: 'core strength',
                    capacity: 5,
                    start_times: ['7:00', '9:00', '11:00'],
                    image: 'yoga.jpg')

    expect(Activity.count).to eq(1)
  end

  it 'cant create an activity with missing fields' do
    Activity.create(name: 'Yoga',
                    description: 'core strength',
                    capacity: 5,
                    start_times: ['7:00', '9:00', '11:00'])

    expect(Activity.count).to eq(0)
  end
end
