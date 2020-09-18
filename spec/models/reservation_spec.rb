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
end
