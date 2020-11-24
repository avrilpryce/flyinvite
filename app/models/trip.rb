class Trip < ApplicationRecord
  belongs_to :host, foreign_key: :user_id, class_name: "User"
  has_many :users_trips
  has_many :users, through: :users_trips

  validates :name, :city, :country, presence: true
  validates :name, uniqueness: true
  # validates :start_date, :end_date, presence: true
end
