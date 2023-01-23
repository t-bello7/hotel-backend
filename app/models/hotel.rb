class Hotel < ApplicationRecord
  belongs_to :user
  has_many :rooms
  has_many_attached :images

  validates :name, :location, :email, :phone_number, presence: true
end
