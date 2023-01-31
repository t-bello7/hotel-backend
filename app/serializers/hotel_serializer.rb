class HotelSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :location, :email, :phone_number, :user_id, :image_url
end
