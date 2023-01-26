class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :role, :password, :password_confirmation

  has_many :bookings
  has_many :hotels
end
