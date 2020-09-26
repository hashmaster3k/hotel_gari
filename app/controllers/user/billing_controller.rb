class User::BillingController < User::BaseController
  def index
    @reservations = current_user.reservations
  end

  def show
    @reservation = Reservation.select("reservations.*, rooms.beds, rooms.image, rooms.description, rooms.price, rooms.river_view").joins(:room).find(params[:id])
  end
end
