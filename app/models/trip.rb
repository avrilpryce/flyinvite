class Trip < ApplicationRecord
  belongs_to :host, foreign_key: :user_id, class_name: "User"
  has_many :users_trips
  has_many :users, through: :users_trips
end
