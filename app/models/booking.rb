class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :days, presence: true
  validates :booking_date, presence: true
  validates :amount, presence: true 
  validates :hotel_id, presence: true 
  validates :room_id, presence: true  
end
