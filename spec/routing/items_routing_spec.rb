require "rails_helper"

RSpec.describe Api::V1::ItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "bucketlists/:bucketlist_id/items").
        to route_to("api/v1/items#index",
                    format: :json,
                    bucketlist_id: ":bucketlist_id")
    end

    it "does not route to #index without a bucket list id" do
      expect(get: "/items").not_to be_routable
    end

    it "routes to #show" do
      expect(get: "bucketlists/:bucketlist_id/items/1").
        to route_to("api/v1/items#show",
                    id: "1",
                    format: :json,
                    bucketlist_id: ":bucketlist_id")
    end

    it "does not route to #show without a bucket list id" do
      expect(get: "/items/1").not_to be_routable
    end

    it "routes to #update" do
      expect(put: "bucketlists/:bucketlist_id/items/1").
        to route_to("api/v1/items#update",
                    id: "1",
                    format: :json,
                    bucketlist_id: ":bucketlist_id")
    end

    it "does not route to #update without a bucket list id" do
      expect(put: "/items/1").not_to be_routable
    end

    it "routes to #create" do
      expect(post: "bucketlists/:bucketlist_id/items").
        to route_to("api/v1/items#create",
                    format: :json,
                    bucketlist_id: ":bucketlist_id")
    end

    it "does not route to #create without a bucket list id" do
      expect(post: "/items").not_to be_routable
    end

    it "routes to #destroy" do
      expect(delete: "bucketlists/:bucketlist_id/items/1").
        to route_to("api/v1/items#destroy",
                    id: "1",
                    format: :json,
                    bucketlist_id: ":bucketlist_id")
    end

    it "does not route to #destroy without a bucket list id" do
      expect(delete: "/items/1").not_to be_routable
    end
  end
end
