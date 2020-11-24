class ChangeClassToFlightClassOnTrips < ActiveRecord::Migration[6.0]
  def change
    rename_column :trips, :class, :flight_class
  end
end
