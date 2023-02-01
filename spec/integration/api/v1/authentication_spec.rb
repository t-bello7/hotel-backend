# spec/requests/blogs_spec.rb
require 'swagger_helper'

describe 'Aunth Athentication API' do
  path '/auth/login' do
    post 'Login with your created email and password' do
      tags 'Authentication'
      consumes 'application/json'
      parameter name: :login, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          email: { type: :string }
        },
        required: %w[username password]
      }

      response '201', '{ token: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE2NzUyNjk3MzJ9.v--VeLHaZ3GYPIE8W2oeImOqF4Gz4ozSwxnn4Q9aPpk }' do
        let(:login) { { email: 'www.example.com', password: 1234 } }
        run_test!
      end

      response '422', 'invalid username or password' do
        let(:auth) { { email: 'example.com' } }
        run_test!
      end
    end
  end  
end
