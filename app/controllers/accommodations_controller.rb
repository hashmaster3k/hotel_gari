class AccommodationsController < ApplicationController
  def index
    @rooms = Room.all
  end
end
