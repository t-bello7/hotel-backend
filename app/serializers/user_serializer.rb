class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :role, :authentication_token
  has_many :bookings
  has_many :hotels
end
