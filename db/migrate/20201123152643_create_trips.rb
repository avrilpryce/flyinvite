class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :street
      t.string :zip
      t.string :city
      t.string :country
      t.datetime :start_date
      t.datetime :end_date
      t.integer :max_price
      t.string :class
      t.datetime :latest_arrival
      t.datetime :earliest_departure

      t.timestamps
    end
  end
end
