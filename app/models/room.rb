class Room < ApplicationRecord
  validates_presence_of :beds, :price
end
