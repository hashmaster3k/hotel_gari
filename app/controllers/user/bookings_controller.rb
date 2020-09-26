class User::BookingsController < User::BaseController
  def new
    @room = Room.find(params[:room])
  end

  def create
    room = Room.find(params[:room])
    Reservation.create(user_id: current_user.id,
                       room_id: room.id,
                       check_in: current_search.check_in,
                       check_out: current_search.check_out,
                       guests: current_search.guests,
                       total_cost: current_search.total_cost(room.price))
    redirect_to user_billing_index_path
  end
end
