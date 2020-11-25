# require 'json'
# require 'open-uri'

# url = 'https://tequila-api.kiwi.com/v2/search?fly_from=PRG&fly_to=LGW&dateFrom=30/11/2020&dateTo=12/12/2020&apikey=-AelutfLM6HjWbuN3GUtuKH929f-7FhH'
# flights = open(url).read
# flight_list = JSON.parse(flights)

# puts flight_list



class FlightBookingsController < ApplicationController

    def flight_search



    end 

    private 


  def flight_search_params
    params.require(:flight_booking).permit(:departure_airport_code, :arrival_airport_code, :zip, :city, :country, :start_date, :end_date, :airport_code, :max_price, :flight_class, :latest_arrival, :earliest_departure)
  end

end


# t.string "departure_airport_code"
#     t.string "arrival_airport_code"
#     t.string "airline"
#     t.string "flight_number"
#     t.integer "price"
#     t.string "flight_class"
#     t.datetime "departure_date_local"
#     t.datetime "arrival_date_local"
#     t.datetime "departure_date_utc"
#     t.datetime "arrival_date_utc"
#     t.boolean "booked", default: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["trip_id"], name: "index_flight_bookings_on_trip_id"
#     t.index ["user_id"], name: "index_flight_bookings_on_user_id"