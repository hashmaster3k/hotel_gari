#spec/models/search_spec.rb

require 'rails_helper'

RSpec.describe Search do
  before :each do
    @search = Search.new({"check_in" => ["2020-01-01"],
                          "check_out" => ["2020-01-03"],
                          "guests" => 2,
                          "view" => true})
  end

  describe 'object model' do
    it 'can create an object' do
      expect(@search.class).to eq(Search)
    end

    it 'has readable attributes' do
      expect(@search.check_in).to eq("2020-01-01")
      expect(@search.check_out).to eq("2020-01-03")
      expect(@search.guests).to eq(2)
      expect(@search.view).to eq(true)
    end
  end

  describe 'instance methods' do
    it '.check_in_formatted' do
      expect(@search.check_in_formatted).to eq("01-01-2020")
    end

    it '.check_out_formatted' do
      expect(@search.check_out_formatted).to eq("01-03-2020")
    end

    it '.num_nights' do
      expect(@search.num_nights).to eq(2)
    end

    it 'total_cost' do
      expect(@search.total_cost(99.99)).to eq(199.98)
    end
  end
end
