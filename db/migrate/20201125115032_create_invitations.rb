class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :trip, null: false, foreign_key: true
      t.string :email
      t.string :status, :default => "Pending"

      t.timestamps
    end
  end
end
