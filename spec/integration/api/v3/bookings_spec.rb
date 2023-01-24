# spec/requests/blogs_spec.rb
require 'swagger_helper'

describe 'Bookings API' do

  path '/api/v3/bookings' do

    post 'Creates a room' do
      tags 'Bookings'
      consumes 'application/json'
      parameter name: :booking, in: :body, schema: {
        type: :object,                
        properties: {
          days: { type: :integer },
          booking_date: { type: :datetime },
          amount: { type: :float },        
          room_id: { type: :bigint },
          user_id: { type: :bigint },
        },
        required: [ 'days', 'booking_date', 'amount', 'user_id', 'room_id' ]
      }

      response '201', 'hotel created' do
        let(:booking) { { days: 5, booking_date: '2023-14-05', amount: 60 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:booking) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v3/bookings/{id}' do

    get 'Retrieves a booking' do
      tags 'Bookings', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string
      request_body_example value: { some_field: 'Foo' }, name: 'basic', summary: 'Request example description'

      response '200', 'booking found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            days: { type: :string },
            booking_date: { type: :datetime },
            amount: { type: :float },        
            room_id: { type: :bigint },
            created_at: { type: :timestamps },
            updated_at: {type: :timestamps }
          },
          required: [ 'id', 'name', 'location', 'email', 'phone_number', 'room_id' ]

        let(:id) { Booking.create(name: 'foo', location: 'location address', email: 'example.com', phone_number: '23490567432').id }
        run_test!
      end

      response '404', 'booking not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end