class HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :email, :phone_number

  belongs_to :user
  has_many :rooms
end
