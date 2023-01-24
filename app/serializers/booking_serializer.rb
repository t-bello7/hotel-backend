class BookingSerializer < ActiveModel::Serializer
  attributes :id, :days, :booking_date, :amount

  belongs_to :user
  belongs_to :room
end
