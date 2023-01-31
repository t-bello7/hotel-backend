class RoomSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :room_type, :bed_count, :price, :reserved, :image_url
end
