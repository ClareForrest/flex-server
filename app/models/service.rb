class Service < ApplicationRecord
  has_many :bookings

  # validations:
  validates :name, presence: true
  validates :cost, presence: true
end
