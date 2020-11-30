class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # N:N relationships:
  has_many :owned_trips, class_name: "Trip"

  has_many :users_trips
  has_many :trips, through: :users_trips

  has_many :flightbookings, dependent: :destroy

  # Validation:
  validates :first_name, :last_name, :username, :job_title, :company, presence: true
  validates :email, uniqueness: true
end
