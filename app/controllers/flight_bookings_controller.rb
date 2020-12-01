# require 'json'
# require 'open-uri'
class FlightBookingsController < ApplicationController
  #  @user_flight_selection = []
  
  def new
    @flight_booking = FlightBooking.new
  end
  
  def create

    @trip = Trip.find(params[:trip_id])
    @flight_booking = FlightBooking.new(flight_params)
    @flight_booking.user = current_user
    @flight_booking.trip = @trip
    @flight_booking.save

    # if @flight_booking.save
    #   redirect_to 
    # else
    #   render
    # end
  end

  def destroy
    @flight_booking = FlightBooking.find[:id]
    @flight_booking.destroy
  end 

  # def destroy_flight_booking_selection
  #    @flight_booking = FlightBooking.find[:booking_link]
  #     @flight_booking.destroy
  # end

  
private

  # def flight_params
  #   params.require(:flight_booking).permit(:departure_airport_code, :arrival_airport_code, :airline, :flight_number, :price, :flight_class, :booking_link, :departure_date_local, :arrival_date_local, :departure_date_utc, :arrival_date_utc, :booked)
  # end

end