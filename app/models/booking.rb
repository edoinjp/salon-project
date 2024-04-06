class Booking < ApplicationRecord
  # Valid statuses: approved, declined, pending
  # enum booking_status: { pending: 0, approved: 1, declined: 2 }

  # validates :booking_status, inclusion: { in: %w(approved declined pending) }

  belongs_to :user
  belongs_to :service
  belongs_to :administrator

  validates :booking_date, presence: true

  def pending?
    status == 'pending'
  end
end
