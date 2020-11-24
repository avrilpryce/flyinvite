class CreateFlightBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :flight_bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true
      t.string :departure_airport_code
      t.string :arrival_airport_code
      t.string :airline
      t.string :flight_number
      t.integer :price
      t.string :flight_class
      t.datetime :departure_date_local
      t.datetime :arrival_date_local
      t.datetime :departure_date_utc
      t.datetime :arrival_date_utc
      t.boolean :booked, default: false

      t.timestamps
    end
  end
end
