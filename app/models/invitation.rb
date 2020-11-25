class Invitation < ApplicationRecord
  STATUS = ["Pending", "Accepted", "Declined"]

  belongs_to :trip

  validates :email, presence: true
end
