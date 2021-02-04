class Employee < ApplicationRecord
  belongs_to :user

  validates :availability, presence: true
end
