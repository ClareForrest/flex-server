class Booking < ApplicationRecord
  belongs_to :user 
  belongs_to :service
  # needs to connect to employees availabilty

  # validations:
  validates :location, presence: true
  validates :date, presence: true
  validates :time, presence: true
end
