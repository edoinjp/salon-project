class User < ApplicationRecord
  has_many :bookings

  validates :username, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 } #  minimum password length validation

  validates :phone_number, length: { maximum: 11 }
end
