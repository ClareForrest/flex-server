class User < ApplicationRecord
  has_secure_password
  validates :password_digest, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_one :address
  has_many :bookings
end
