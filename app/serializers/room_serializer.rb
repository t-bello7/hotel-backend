class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :room_type, :bed_count, :price 

  belongs_to :hotel
  has_many :bookings 
end
