class AddTimeToFlightBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :flight_bookings, :departure_time_utc, :datetime
    add_column :flight_bookings, :departure_time_local, :datetime
    add_column :flight_bookings, :arrival_time_utc, :datetime
    add_column :flight_bookings, :arrival_time_local, :datetime
  end
end


