class TripsController < ApplicationController
  def index
    @trips = current_user.owned_trips
  end

  def show
    @trip = Trip.find(params[:id])
    @invitation = Invitation.new
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @host = current_user
    @trip.host = @host

    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :street, :zip, :city, :country, :start_date, :end_date, :airport_code, :max_price, :flight_class, :latest_arrival, :earliest_departure)
  end
end
