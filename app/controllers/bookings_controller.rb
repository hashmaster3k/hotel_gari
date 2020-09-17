class BookingsController < ApplicationController
  def index
    @rooms = Room.available_rooms
  end

  def new
    if current_user
      redirect_to user_bookings_new_path
    else
      flash[:error] = "You must be logged in or register to continue"
      redirect_to bookings_path
    end
  end
end
