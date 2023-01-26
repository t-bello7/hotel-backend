class AddHotelRefToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :hotel, null: false, foreign_key: true
  end
end
