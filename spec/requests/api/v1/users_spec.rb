require 'rails_helper'

RSpec.describe '/api/v1/users', type: :request do
  let(:valid_attributes) { { username: 'test user', email: 'text@tes.com', password: '123password', password_confirmation: '123password', role: 'default' } }

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      User.create! valid_attributes
      get api_v1_users_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      user = User.create! valid_attributes
      get api_v1_user_url(user), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Api::v1::User' do
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
      it 'does not create a new Api::v1::User' do
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

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested api_v1_user' do
        user = User.create! valid_attributes
        patch api_v1_user_url(user),
              params: { api_v1_user: new_attributes }, headers: valid_headers, as: :json
        user.reload
        skip('Add assertions for updated state')
      end

      it 'renders a JSON response with the api_v1_user' do
        user = User.create! valid_attributes
        patch api_v1_user_url(user),
              params: { api_v1_user: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the api_v1_user' do
        user = User.create! valid_attributes
        patch api_v1_user_url(user),
              params: { api_v1_user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested api_v1_user' do
      user = User.create! valid_attributes
      expect do
        delete api_v1_user_url(user), headers: valid_headers, as: :json
      end.to change(User, :count).by(-1)
    end
  end
end
