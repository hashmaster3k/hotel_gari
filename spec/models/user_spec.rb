# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_presence_of :password }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zip }
    it { should validate_uniqueness_of :username }
  end

  describe 'instance methods'do
    it 'returns full name' do
      user = User.create!(username: 'user',
                  password: '123',
                  first_name: 'Joe',
                  last_name: 'James',
                  address: '1382 JJ Drive',
                  city: 'Denver',
                  state: 'CO',
                  zip: 80210)

      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
    end
  end
end
