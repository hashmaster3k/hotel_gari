# spec/features/bookings/index_spec.rb

require 'rails_helper'

RSpec.describe 'BOOKINGS INDEX PAGE' do
  it 'has a valid link to bookings' do
    visit '/bookings'
  end
end
