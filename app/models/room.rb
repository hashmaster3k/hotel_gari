class Room < ApplicationRecord
  validates_presence_of :beds, :price, :image, :description

  has_many :reservations

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

  def self.available_rooms
    Room.where(is_rented: false)
  end
end
