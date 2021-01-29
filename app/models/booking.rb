class Booking < ApplicationRecord
  belongs_to :user 

  has_one :service
  # needs to connect to employees availabilty

  # validations:
  validates :location, presence: true
  validates :date, presence: true 
  validates :time, presence: true 
end
