class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :role

  has_many :bookings
  has_many :hotels
end
