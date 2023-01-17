class Room < ApplicationRecord
  belongs_to :hotel
  has_many_attached :images
end
