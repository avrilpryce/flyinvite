# require 'json'
# require 'open-uri'
class FlightBookingsController < ApplicationController
  

  def flight_search

    # url = 'https://tequila-api.kiwi.com/v2/search?fly_from=PRG&fly_to=LGW&dateFrom=30/11/2020&dateTo=12/12/2020&apikey=-AelutfLM6HjWbuN3GUtuKH929f-7FhH'
    # flights = open(url).read
    # flight_list = JSON.parse(flights)

    # puts flight_list\\

   end
   
  def find_location
   puts params
  end 

  private


  # def flight_search_params
  #   params.require(:flight_booking).permit(:departure_airport_code, :arrival_airport_code, :zip, :city, :country, :start_date, :end_date, :airport_code, :max_price, :flight_class, :latest_arrival, :earliest_departure)
  # end


end