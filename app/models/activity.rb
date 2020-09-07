class Activity < ApplicationRecord
  validates_presence_of :name, :description, :capacity, :start_times, :image
end
