class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :days, presence: true
  validates :booking_date, presence: true
  validates :amount, presence: true
end
