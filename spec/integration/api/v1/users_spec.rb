# spec/requests/blogs_spec.rb
require 'swagger_helper'

describe 'Users API' do
  path '/api/v1/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          email: { type: :string },
          role: { type: :string },
          password: { type: :string }
        },
        required: %w[username email role password]
      }

      response '201', 'hotel created' do
        let(:user) { { username: 'foo', email: 'www.example.com', role: 'user', password: 1234 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { username: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/users/' do
    get 'Retrieves all users' do
      tags 'Users'
      produces 'application/json'
      parameter in: :path, type: :string
      request_body_example value: { some_field: 'Foo' }, name: 'basic', summary: 'Ensure you add the authentication sent to you during login token to your request header'

      response '200', 'User created' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 username: { type: :string },
                 email: { type: :string },
                 role: { type: :string },
                 password: { type: :string }
               },
               required: %w[id username email role password]

        let(:id) { User.create(username: 'foo', email: 'www.example.com', role: 'user', password: '1234', created_at: '2023-01-31T17:27:09.157Z', updated_at: '2023-01-31T17:27:09.157Z').id }
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

  path '/api/v1/users/{id}' do
    get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string
      request_body_example value: { some_field: 'Foo' }, name: 'basic', summary: 'Request example description'

      response '200', 'hotel found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 username: { type: :string },
                 email: { type: :string },
                 role: { type: :string },
                 password: { type: :string },
                 created_at: { type: :timestamps },
                 updated_at: { type: :timestamps }
               },
               required: %w[id username email role password]

        let(:id) { User.create(username: 'foo', email: 'www.example.com', role: 'user', paaword: '1234').id }
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

  path '/api/v1/users/{id}' do
    delete 'Delete a user' do
      tags 'Users'
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

      response '404', 'user not found' do
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
