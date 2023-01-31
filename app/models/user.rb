class User < ApplicationRecord
  require 'securerandom'

  has_secure_password

  has_many :bookings
  has_many :hotels

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :role, presence: true
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true, length: { in: 1..250 }

  ROLES = %i[admin user].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end
end
