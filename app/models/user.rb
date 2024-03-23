class User < ApplicationRecord
  has_meny :bookings
  validates :user_name, presence: true, length:  { maximum: 50 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_hash, presence: true
  validates :phone_number, length: { maximum: 11 }

end
