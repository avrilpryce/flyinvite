# require 'json'
# require 'open-uri'
class FlightBookingsController < ApplicationController
  
  def new
    @flightBooking = FlightBooking.new
  end
  
  def create
    @flightBooking = FlightBooking.new(flight_params)
    @user= current_user
    # @flightBooking.host = @host

    # if @flightBooking.save
    #   redirect_to trip_path(@trip)
    # else
    #   render :new
    # end
  end

  def destroy
    
  end 

private

  def flight_params
    params.require(:flight_booking).permit(:departure_airport_code, :arrival_airport_code, :airline, :flight_number, :price, :flight_class, :booking_link, :departure_date_local, :arrival_date_local, :departure_date_utc, :arrival_date_utc, :booked)
  end

end