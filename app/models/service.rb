class Service < ApplicationRecord
  has_many :bookings

  validates :name, presence: true
  validates :duration, presence: ture, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
