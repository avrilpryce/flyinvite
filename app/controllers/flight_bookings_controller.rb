# require 'json'
# require 'open-uri'
class FlightBookingsController < ApplicationController
  #  @user_flight_selection = []
  
  def new
    @flight_booking = FlightBooking.new
  end
  
  def create
    @flight_booking = FlightBooking.create(flight_params)
    @user = current_user
    # How to get host tip_id?
    @flight_booking.user = @user
    @user_flight_selection << @flight_booking

  end

  def destroy
    @flight_booking = FlightBooking.find[:id]
    @flight_booking.destroy
  end 

private

  def flight_params
    params.require(:flight_booking).permit(:departure_airport_code, :arrival_airport_code, :airline, :flight_number, :price, :flight_class, :booking_link, :departure_date_local, :arrival_date_local, :departure_date_utc, :arrival_date_utc, :booked)
  end

end