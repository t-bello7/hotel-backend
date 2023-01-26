# spec/requests/blogs_spec.rb
require 'swagger_helper'

describe 'Rooms API' do
  path '/api/v1/rooms' do
    post 'Creates a room' do
      tags 'Rooms'
      consumes 'application/json'
      parameter name: :room, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          type: { type: :string },
          bed_count: { type: :integer },
          price: { type: :float },
          hotel_id: { type: :bigint }
        },
        required: %w[name type bed_count price hotel_id]
      }

      response '201', 'room created' do
        let(:rooms) { { name: 'foo', type: 'vip or others', bed_count: 4, price: 80, hotel_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:room) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/rooms/{id}' do
    get 'Retrieves a room' do
      tags 'Rooms', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string
      request_body_example value: { some_field: 'Foo' }, name: 'basic', summary: 'Request example description'

      response '200', 'hotel found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 type: { type: :string },
                 bed_count: { type: :integer },
                 price: { type: :float },
                 hotel_id: { type: :bigint },
                 created_at: { type: :timestamps },
                 updated_at: { type: :timestamps }
               },
               required: %w[id name location email phone_number hotel_id]

        let(:id) { Room.create(name: 'foo', type: 'VIP room', bed_count: 5, hotel_id: 1, price: 99).id }
        run_test!
      end

      response '404', 'hotel not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end
end
