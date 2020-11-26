class Trip < ApplicationRecord
  FLIGHT_CLASSES = ["Economy", "Business", "First Class"]
  
  # 1:N relationship:
  belongs_to :host, foreign_key: :user_id, class_name: "User"

  # N:N relationships:
  has_many :users_trips, dependent: :destroy
  has_many :users, through: :users_trips

  has_many :flight_bookings, dependent: :destroy

  has_many :invitations, dependent: :destroy

  # Validation:
  validates :name, :city, :country, presence: true
  validates :name, uniqueness: true
  validates :start_date, :end_date, presence: true
end
