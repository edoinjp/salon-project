class Booking < ApplicationRecord
  # Valid statuses: approved, declined, pending
  validates :booking_status, inclusion: { in: %w(approved declined pending) }

  belongs_to :user
  belongs_to :service
  belongs_to :administrator

  validates :booking_date, presence: true
end
