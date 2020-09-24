class BookingsController < ApplicationController
  def index
    if params[:commit]
      new_search
    elsif current_search
      old_search
    else
      @rooms = Room.where(is_rented: false)
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
  def new_search
    create_search_session
    check_in = convert_to_date(params[:check_in])
    check_out = convert_to_date(params[:check_out])
    @rooms = Room.available_rooms_filtered(check_in, check_out, params[:guests], params[:river_view])
  end

  def old_search
    check_in = convert_to_date(current_search["check_in"])
    check_out = convert_to_date(current_search["check_out"])
    @rooms = Room.available_rooms_filtered(check_in,
                                           check_out,
                                           current_search["guests"],
                                           current_search["view"])
  end

  def create_search_session
    session[:search_critera] = {check_in: params[:check_in],
                                check_out: params[:check_out],
                                guests: params[:guests],
                                view: params[:river_view]}
  end

  def convert_to_date(string)
    date = string.first.split("-")
    Date.new(date[0].to_i, date[1].to_i, date[2].to_i)
  end
end
