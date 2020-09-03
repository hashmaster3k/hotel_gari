# spec/features/main/index_spec.rb

require 'rails_helper'

RSpec.describe 'MAIN INDEX PAGE' do
  it 'has a valid welcome page' do
    visit '/'
  end
end
