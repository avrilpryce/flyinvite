# require 'json'
# require 'open-uri'
class FlightBookingsController < ApplicationController

  def new
    @flight_booking = FlightBooking.new
  end

  def create

    @trip = Trip.find(params[:trip_id])
    flight_hash = params[:flight_booking]
    flight_hash = JSON.parse(flight_hash)

    save_flight_selection(flight_hash["outbound"])
    save_flight_selection(flight_hash["inbound"])
  end

  def save_flight_selection(strong_params)
    @flight_booking = FlightBooking.new(strong_params)
    @flight_booking.user = current_user
    @flight_booking.trip = @trip
    @flight_booking.flight_class = assign_class(@flight_booking.flight_class)
    # @flight_booking.airline = assign_airline_name(@flight_booking.airline)
    if @flight_booking.save
      puts "Flight Saved!"
    else
      puts "Not saved!"
    end

  end

  def destroy_flight_selection
    p params
    p params[:booking_link]
    @flights = FlightBooking.all
    @flights = @flights.select { |flight| flight[:booking_link] == params[:booking_link] }
    @flights.each { |flight| flight.destroy }
  end

  def destroy
    @flight_booking = FlightBooking.find[:id]
    @flight_booking.destroy
  end


  def assign_class(class_code)

    case class_code
    when "M"
      "Economy"
    when "W"
      "Premium Economy"
    when "C"
      "Business"
    when "F"
      "First"
    else
      "No class assigned"
    end
  end

  # def assign_airline_name(airline_iata)
  #   url = "https://api.skypicker.com/carriers"
  #   url_content = open(url).read
  #   carriers = JSON.parse(url_content)

  #   airline_info = carriers.find { |carrier| carrier["id"] == airline_iata }
  #   airline_info["name"]
  # end

  # def destroy_flight_booking_selection
  #    @flight_booking = FlightBooking.find[:booking_link]
  #     @flight_booking.destroy
  # end

private

  # def flight_params_outbound
  #   # params.require(:flight_booking).permit(:departure_airport_code, :arrival_airport_code, :airline, :flight_number, :price, :flight_class, :booking_link, :departure_date_local, :arrival_date_local, :departure_date_utc, :arrival_date_utc, :booked)
  #   json_params = ActionController::Parameters.new(JSON.parse(params[:flight_booking]))
  #   json_params.require(:flight_booking).permit(outbound:[:departure_airport_code, :arrival_airport_code, :airline, :flight_number, :price, :flight_class, :booking_link, :departure_date_local, :arrival_date_local, :departure_date_utc, :arrival_date_utc, :booked])
  # end

  # def flight_params_inbound
  #   # params.require(:flight_booking).permit(:departure_airport_code, :arrival_airport_code, :airline, :flight_number, :price, :flight_class, :booking_link, :departure_date_local, :arrival_date_local, :departure_date_utc, :arrival_date_utc, :booked)
  #   json_params = ActionController::Parameters.new(JSON.parse(params[:flight_booking]))
  #   json_params.require(:flight_booking).permit(inbound:[:departure_airport_code, :arrival_airport_code, :airline, :flight_number, :price, :flight_class, :booking_link, :departure_date_local, :arrival_date_local, :departure_date_utc, :arrival_date_utc, :booked])
  # end

end