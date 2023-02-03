class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings, dependent: :delete_all
  has_one_attached :image
  after_initialize :init

  def init
    self.reserved = false if reserved.nil?
  end

  validates :price, presence: true
  validates :bed_count, presence: true
  validates :name, presence: true
  validates :reserved, inclusion: [true, false]

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
