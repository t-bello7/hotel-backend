require "rails_helper"

RSpec.describe Api::V0::UsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v0/users").to route_to("api/v0/users#index")
    end

    it "routes to #show" do
      expect(get: "/api/v0/users/1").to route_to("api/v0/users#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/v0/users").to route_to("api/v0/users#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v0/users/1").to route_to("api/v0/users#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v0/users/1").to route_to("api/v0/users#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v0/users/1").to route_to("api/v0/users#destroy", id: "1")
    end
  end
end
