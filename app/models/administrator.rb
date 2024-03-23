class Administrator < ApplicationRecord
  has_many :bookings

  validates :username, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_hash, presence: true

end
