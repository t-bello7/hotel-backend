class Hotel < ApplicationRecord
  belongs_to :user
  has_many :rooms, dependent: :delete_all
  has_one_attached :image

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :location, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
