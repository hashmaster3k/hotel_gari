class User::BookingsController < User::BaseController
  def new
    @room = Room.find(params[:format])
  end
end
