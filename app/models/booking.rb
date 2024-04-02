class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service
  belongs_to :administrator

  validates :booking_date, presence: true
end
