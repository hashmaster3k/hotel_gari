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

  def self.available_rooms_filtered(date_check_in, date_check_out, num_guests, view)
    available_rooms_within_dates(date_check_in, date_check_out).where(river_view: view)
  end

  def self.available_rooms_within_dates(date_check_in, date_check_out)
    ids_not_to_include = Room.joins(:reservations).where('check_out >= ? AND check_in <= ?', date_check_in, date_check_out).pluck(:id)
    Room.left_outer_joins(:reservations).where.not(id: ids_not_to_include)
  end
end
