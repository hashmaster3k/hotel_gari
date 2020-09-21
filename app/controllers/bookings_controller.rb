class BookingsController < ApplicationController
  def index
    if params[:commit]
      check_in = convert_to_date(params[:check_in])
      check_out = convert_to_date(params[:check_out])
      @rooms = Room.available_rooms_filtered(check_in, check_out, params[:adults], params[:children], params[:river_view])
      #@rooms = Room.available_rooms_within_dates(check_in, check_out)
    else
      @rooms = Room.available_rooms
    end
  end

  def new
    if current_user
      redirect_to user_bookings_new_path
    else
      flash[:error] = "You must be logged in or register to continue"
      redirect_to bookings_path
    end
  end

  private
  def convert_to_date(string)
    date = string.first.split("-")
    Date.new(date[0].to_i, date[1].to_i, date[2].to_i)
  end
end
