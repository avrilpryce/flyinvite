class Trip < ApplicationRecord
  belongs_to :user
  has_many :users_trips
  has_many :users, through: :users_trips
end
