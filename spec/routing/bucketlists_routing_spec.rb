require "rails_helper"

RSpec.describe Api::V1::BucketlistsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get "/bucketlists").
        to route_to("api/v1/bucketlists#index", format: :json)
    end
    it "routes to #show" do
      expect(get: "/bucketlists/1").
        to route_to("api/v1/bucketlists#show", id: "1", format: :json)
    end
    it "routes to #create" do
      expect(post: "/bucketlists").
        to route_to("api/v1/bucketlists#create", format: :json)
    end
    it "routes to #update via PUT" do
      expect(put: "/bucketlists/1").
        to route_to("api/v1/bucketlists#update", id: "1", format: :json)
    end
    it "routes to #update via PATCH" do
      expect(patch: "/bucketlists/1").
        to route_to("api/v1/bucketlists#update", id: "1", format: :json)
    end
    it "routes to #destroy" do
      expect(delete: "/bucketlists/1").
        to route_to("api/v1/bucketlists#destroy", id: "1", format: :json)
    end
  end
end
