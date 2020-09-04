class Room < ApplicationRecord
  validates_presence_of :beds, :price

  def self.total
    Room.count
  end

  def self.total_with_view
    Room.where(river_view: true).count
  end

  def self.total_available
    Room.where(is_rented: false).count
  end

  def self.total_available_with_view
    Room.where(river_view: true, is_rented: false).count
  end

  def self.average_cost
    Room.average(:price).to_f
  end
end
