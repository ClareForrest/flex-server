class User < ApplicationRecord
  has_secure_password
  has_one :address
  has_one :employee
  has_many :bookings

  # validations:
  validates :first_name, presence: true, length: { in: 2..20 }
  validates :last_name, presence: true, length: { in: 2..20 }
  validates :password_digest, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
end