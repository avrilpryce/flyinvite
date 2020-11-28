class Invitation < ApplicationRecord
  STATUS = ["Pending", "Accepted", "Declined"]

  # 1:N relationship:
  belongs_to :trip

  # Validation:
  validates :email, presence: true
end
