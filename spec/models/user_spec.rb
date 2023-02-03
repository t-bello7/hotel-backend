require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(username: 'Tom', email: 'xyz@gmail.com', role: 'admin', password: '123password', password_confirmation: '123password') }
  before { subject.save }
  it { should have_many(:bookings) }
  it { should have_many(:hotels) }

  context 'Model Validation' do
    it 'Username should not be empty' do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it 'Email should not be empty' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'Role Column should not be empty' do
      subject.role = nil
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

    it 'Email should be valid' do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        subject.email = valid_address
        expect(subject).to be_valid
      end
    end
  end
end
