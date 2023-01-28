class Hotel < ApplicationRecord
  belongs_to :user
  has_many :rooms

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true
  validates :location, presence: true
end
