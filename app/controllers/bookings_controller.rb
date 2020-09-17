class BookingsController < ApplicationController
  def index
    @rooms = Room.available_rooms
  end
end
