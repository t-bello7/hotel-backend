class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :days, :booking_date, :amount, presence: true
end
