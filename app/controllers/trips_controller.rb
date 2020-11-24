class TripsController < ApplicationController
  def index
    @trips = current_user.owned_trips
  end

  def show
    @trip = Trip.find(params[:id])
  end
end
