class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings

  validates :price, presence: true
  validates :bed_count, presence: true
end
