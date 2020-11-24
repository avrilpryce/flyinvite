class FlightBooking < ApplicationRecord
  belongs_to :user
  belongs_to :trip
end
