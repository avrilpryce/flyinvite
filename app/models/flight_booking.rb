class FlightBooking < ApplicationRecord

  # 1:N relationships:
  belongs_to :user
  belongs_to :trip
end
