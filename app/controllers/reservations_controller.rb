class ReservationsController < ApplicationController
  def index
    if params[:commit]
      create_search_session
      @rooms = Room.available_rooms_filtered(params[:check_in], params[:check_out], params[:guests], params[:river_view])
    elsif current_search
      @rooms = Room.available_rooms_filtered(current_search.check_in, current_search.check_out, current_search.guests, current_search.view)
    else
      @rooms = Room.where(is_rented: false)
    end
  end

  def new
    if current_user
      redirect_to new_user_reservation_path(room: params[:room])
    else
      flash[:error] = "You must be logged in or register to continue"
      redirect_to reservations_path
    end
  end

  private
  def create_search_session
    session[:search_critera] = {"check_in" => params[:check_in],
                                "check_out" => params[:check_out],
                                "guests" => params[:guests],
                                "view" => params[:river_view]}
  end
end
