class User::BookingsController < User::BaseController
  def new
    @room = Room.find(params[:room])
  end
end
