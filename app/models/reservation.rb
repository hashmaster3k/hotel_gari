class Reservation < ApplicationRecord
  validates_presence_of :check_in, :check_out, :guests, :status, :total_cost

  belongs_to :room
  belongs_to :user

  enum status: ['active', 'inactive', 'cancelled']
end
