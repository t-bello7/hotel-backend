require 'rails_helper'

RSpec.describe Booking, type: :model do
  let(:new_user) do
    User.new(id: 421, username: 'Tom', email: 'xyz@gmail.com', password: '123password', password_confirmation: '123password')
  end

  let(:new_hotel) do
    Hotel.new(user_id: new_user.id, name: 'test_hotel', location: 'test_location', email: 'test_email@em.com', phone_number: '0803')
  end

  let(:new_room) do
    Room.new(name: 'test_hotel', room_type: 'single', bed_count: 2, price: 34.01, reserved: true, number: 33, hotel_id: new_hotel.id)
  end
  subject { Booking.new(days: 3, booking_date: '2021-12-12', amount: 234.0, room_id: new_room.id, hotel_id: new_hotel.id) }

  context 'Model Association' do
    it { should belong_to(:room) }
    it { should belong_to(:user) }
  end

  context 'Model Validation' do
    it 'Booking Date should not be empty' do
      subject.booking_date = nil
      expect(subject).to_not be_valid
    end
    it 'Days should not be empty' do
      subject.days = nil
      expect(subject).to_not be_valid
    end
    it 'Amount should not be' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
  end
end
