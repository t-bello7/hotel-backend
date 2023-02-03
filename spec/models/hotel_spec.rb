require 'rails_helper'

RSpec.describe Hotel, type: :model do
  let(:new_user) do
    User.new(id: 421, username: 'Tom', email: 'xyz@gmail.com', password: '123password', password_confirmation: '123password')
  end

  subject { Hotel.new(user_id: new_user.id, name: 'test_hotel', location: 'test_location', email: 'test_email@em.com', phone_number: '0803') }

  before do
    subject.save
  end

  context 'Model Association' do
    it { should belong_to(:user) }
  end

  context 'Model Validation' do
    it 'Name should not be empty' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'Location should not be empty' do
      subject.location = nil
      expect(subject).to_not be_valid
    end
    it 'Phone Number should not be empty' do
      subject.phone_number = nil
      expect(subject).to_not be_valid
    end
    it 'Email should be invalid' do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        subject.email = invalid_address
        expect(subject).to_not be_valid
      end
    end
  end
end
