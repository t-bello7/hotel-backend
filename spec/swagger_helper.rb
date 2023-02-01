require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {        
        title: 'Hotel API V1',
        description: 'This api helps you helps you retrive data for the frontend hotel app. 
        
                      Following the following guildlines to get started

                      Step 1: use the following base link: https://hotel-backend.fly.dev during your api fetch, remember to add the user create path link
                      check example how to create a user account under User Post, After creating user details

                      Step 2: Login with your created email and password via this link https://hotel-backend.fly.dev/api/auth/login. 
                      See the login example below. Once you login, an authentication token will be sent to you

                      Step 3: Put the authentication token to the header section of your http fetch command in every of you subsequent request according to the example paths',
        version: '1.0.0'
      },
      paths: 'https://hotel-backend.fly.dev',
      servers: [
        {
          url: 'https://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'hotel-backend.fly.dev'
            }
          }
        }
      ]
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end
