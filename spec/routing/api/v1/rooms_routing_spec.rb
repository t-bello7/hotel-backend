require 'rails_helper'

RSpec.describe Api::V1::RoomsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v2/rooms').to route_to('api/v2/rooms#index')
    end

    it 'routes to #show' do
      expect(get: '/api/v2/rooms/1').to route_to('api/v2/rooms#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v2/rooms').to route_to('api/v2/rooms#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v2/rooms/1').to route_to('api/v2/rooms#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v2/rooms/1').to route_to('api/v2/rooms#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v2/rooms/1').to route_to('api/v2/rooms#destroy', id: '1')
    end
  end
end
