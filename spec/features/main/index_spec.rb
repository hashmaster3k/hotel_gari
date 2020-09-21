# spec/features/main/index_spec.rb

require 'rails_helper'

RSpec.describe 'MAIN INDEX PAGE' do
  it 'has a valid welcome page' do
    visit '/'
  end

  it 'shows the main page image' do
    visit '/'
    expect(page).to have_xpath("//img['#{'overview.jpg'}']")
  end

  it 'has three other images' do
    visit '/'
    expect(page).to have_xpath("//img['#{'img_1.jpg'}']")
    expect(page).to have_xpath("//img['#{'img_2.jpg'}']")
    expect(page).to have_xpath("//img['#{'img_3.jpg'}']")
  end

  it 'has a quick booking search box' do
    visit '/'

    within '.search-box'do
      expect(page).to have_content('Check-in')
      expect(page).to have_content('Check-out')
      expect(page).to have_content('Guests')
    end
  end
end
