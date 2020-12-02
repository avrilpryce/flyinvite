class AddBookingLinkToFlightBookings < ActiveRecord::Migration[6.0]
  def change
     add_column :flight_bookings, :booking_link, :string
  end
end
