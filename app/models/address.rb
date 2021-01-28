class Address < ApplicationRecord
  belongs_to :user

  
  # validations:
  validates :street, presence: true
  validates :suburb, presence: true
  validates :state, presence: true
  validates :postcode, presence: true 
end


