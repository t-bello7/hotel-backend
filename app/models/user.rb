class User < ApplicationRecord
  require 'securerandom'

  has_secure_password

  has_many :bookings, dependent: :delete_all
  has_many :hotels, dependent: :delete_all
  has_one_attached :profile_picture

  after_initialize :init

  def init
    self.role = 'default' if role.nil?
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true, length: { in: 1..250 }

  ROLES = %i[admin default].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end

  def profile_picture_url
    Rails.application.routes.url_helpers.url_for(profile_picture) if profile_picture.attached?
  end
end
