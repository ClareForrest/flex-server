class Employee < ApplicationRecord
  belongs_to :user 

  validates :availability, presence: true
  validates :user_id, presence: true
end
