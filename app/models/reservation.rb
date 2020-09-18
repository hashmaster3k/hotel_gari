class Reservation < ApplicationRecord
  validates_presence_of :check_in, :check_out, :adults, :children, :status

  belongs_to :room
  belongs_to :user
end
