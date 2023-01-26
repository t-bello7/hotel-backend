require 'swagger_helper'

RSpec.describe '/api/v1/sessions', type: :request do
    describe 'POST /create' do
    context 'with valid parameters' do
      it 'Logins a new Api::v1::User' do
        expect do
          post api_v1_users_url,
               params: { api_v1_user: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Api.v1::User, :count).by(1)
      end

      it 'renders a JSON response with the new api_v1_user' do
        post api_v1_users_url,
             params: { api_v1_user: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not login a new Api::v1::User' do
        expect do
          post api_v1_users_url,
               params: { api_v1_user: invalid_attributes }, as: :json
        end.to change(User, :count).by(0)
      end

      it 'renders a JSON response with errors for the new api_v1_user' do
        post api_v1_users_url,
             params: { api_v1_user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
