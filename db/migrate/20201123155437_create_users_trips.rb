class CreateUsersTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :users_trips do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
