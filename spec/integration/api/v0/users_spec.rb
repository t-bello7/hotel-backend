# spec/requests/blogs_spec.rb
require 'swagger_helper'

describe 'Users API' do
  path '/api/v0/users' do
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

  path '/api/v0/users/{id}' do
    get 'Retrieves a user' do
      tags 'Users', 'Another Tag'
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
end
