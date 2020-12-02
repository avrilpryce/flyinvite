class DeleteTimeColumnsFromFlightBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :flight_bookings, :departure_time_utc
    remove_column :flight_bookings, :departure_time_local
    remove_column :flight_bookings, :arrival_time_utc
    remove_column :flight_bookings, :arrival_time_local
  end
end
