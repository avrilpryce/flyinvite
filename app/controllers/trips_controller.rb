class TripsController < ApplicationController
  def index
    @trips = Trip.where(trip.host = current_user)
  end
end
