require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:new_user) do
    User.new(id: 421, username: 'Tom', email: 'xyz@gmail.com', password: '123password', password_confirmation: '123password')
  end

  let(:new_hotel) do
    Hotel.new(user_id: new_user.id, name: 'test_hotel', location: 'test_location', email: 'test_email@em.com', phone_number: '0803')
  end

  subject { Room.new(name: 'test_hotel', room_type: 'single', bed_count: 2, price: 34.01, reserved: true, number: 33, hotel_id: new_hotel.id) }
  before { subject.save }

  context 'Model Association' do
    it { should belong_to(:hotel) }
  end

  context 'Model Validation' do
    it 'Text should not be empty' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Room Type not be empty' do
      subject.room_type = nil
      expect(subject).to_not be_valid
    end

    it 'Bed Count not be empty' do
      subject.bed_count = nil
      expect(subject).to_not be_valid
    end

    it 'Price not be empty' do
      subject.price = nil
      expect(subject).to_not be_valid
    end
  end
end
