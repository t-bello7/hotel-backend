require 'swagger_helper'

RSpec.describe 'api/v1/authentication', type: :request do
  describe 'POST /login' do
    context 'with valid parameters' do
      it 'creates a new Api::v1::Booking' do
        expect do
          post api_v1_bookings_url,
               params: { api_v1_booking: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Booking, :count).by(1)
      end

      it 'renders a JSON response with the new api_v1_booking' do
        post api_v1_bookings_url,
             params: { api_v1_booking: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Api::v1::Booking' do
        expect do
          post api_v1_bookings_url,
               params: { api_v1_booking: invalid_attributes }, as: :json
        end.to change(Booking, :count).by(0)
      end

      it 'renders a JSON response with errors for the new api_v1_booking' do
        post api_v1_bookings_url,
             params: { api_v1_booking: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
