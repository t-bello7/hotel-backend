# spec/requests/blogs_spec.rb
require 'swagger_helper'

describe 'Hotels API' do
  path '/api/v1/hotels' do
    post 'Creates a hotel' do
      tags 'Hotels'
      consumes 'application/json'
      parameter name: :hotel, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          location: { type: :string },
          email: { type: :string },
          phone_number: { type: :integer },
          user_id: { type: :bigint }
        },
        required: %w[name location email phone_number user_id]
      }

      response '201', 'hotel created' do
        let(:hotel) { { name: 'foo', location: 'location address', email: 'example.com', phone_number: '23490567432', user_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:hotel) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/hotels/{id}' do
    get 'Retrieves a hotel' do
      tags 'Hotels'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string
      request_body_example value: { some_field: 'Foo' }, name: 'basic', summary: 'Request example description'

      response '200', 'hotel found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 location: { type: :string },
                 email: { type: :string },
                 phone_number: { type: :integer },
                 user_id: { type: :integer },
                 created_at: { type: :timestamps },
                 updated_at: { type: :timestamps }
               },
               required: ['id', 'name', 'location', 'email', 'phone_number', { user_id: 1 }]

        let(:id) { Hotel.create(name: 'foo', location: 'location address', email: 'example.com', phone_number: '23490567432', user_id: 1).id }
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

  path '/api/v1/hotels/{id}' do
    patch 'Update a hotel' do
      tags 'Hotels'
      consumes 'application/json'
      parameter name: :id, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer }
        },
        required: [{ user_id: 1 }]
      }

      response '201', 'hotel Updated' do
        let(:hotel) { { id: 1, user_id: 1 } }
        run_test!
      end

      response '422', 'id not found' do
        let(:hotel) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/hotels/{id}' do
    delete 'Delete a hotel' do
      tags 'Hotels'
      consumes 'application/json'
      parameter name: :id, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer }
        }
      }

      response '201', 'deleted succesffully' do
        let(:hotel) { { id: 1 } }
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
