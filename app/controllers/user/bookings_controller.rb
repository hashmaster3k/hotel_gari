class User::BookingsController < User::BaseController
  def new
    @room = Room.find(params[:room])
  end

  def create
    Reservation.create(user_id: current_user.id,
                       room_id: params[:room].to_i,
                       check_in: current_search.check_in,
                       check_out: current_search.check_out,
                       guests: current_search.guests)
    redirect_to user_billing_index_path
  end
end
