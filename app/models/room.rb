class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings
  has_one_attached :image

  validates :price, presence: true
  validates :bed_count, presence: true
  validates :name, presence: true, uniqueness: true
  validates :number, presence: true, uniqueness: true
  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
