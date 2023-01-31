class Hotel < ApplicationRecord
  belongs_to :user
  has_many :rooms
  has_one_attached :image

  validates :name, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true
  validates :location, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
