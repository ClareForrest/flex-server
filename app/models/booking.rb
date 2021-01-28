class Booking < ApplicationRecord
  belongs_to :user 

  has_one :service

  # validations:
  validates :location, presence: true
  validates :date, presence: true 
  validates :time, presence: true 
end
