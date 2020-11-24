class AddAirportColumnToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :airport_code, :string
  end
end
