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
end
