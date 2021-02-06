class User < ApplicationRecord
  has_secure_password
  has_one :address
  has_one :employee
  has_many :bookings

  # validations:
<<<<<<< HEAD
  # validates :first_name, length: { in: 2..20 }
  # validates :last_name, length: { in: 2..20 }
  # validates :password_digest, presence: true
  # validates :email, presence: true
  # validates :phone_number, presence: true
=======
  validates :first_name, length: { in: 2..20 }
  validates :last_name, length: { in: 2..20 }
  validates :password_digest, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
>>>>>>> 50a1dcf4245ac7da1b2e4df76c4447fd5f0c16f5
end