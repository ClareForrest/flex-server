class Service < ApplicationRecord
  belongs_to :booking

  # validations:
  validates :name, presence: true
  validates :cost, presence: true 
end
