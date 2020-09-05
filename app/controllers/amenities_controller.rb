class AmenitiesController < ApplicationController
  def index
    @activites = Activity.all
  end
end
