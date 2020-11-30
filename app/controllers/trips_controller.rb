class TripsController < ApplicationController
  def index
    if current_user.host
      @trips = current_user.owned_trips
    else
      @trips = current_user.trips
    end
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

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    
    if @trip.update(trip_params)
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :street, :zip, :city, :country, :start_date, :end_date, :airport_code, :max_price, :flight_class, :latest_arrival, :earliest_departure, :description, :photo)
  end
end

