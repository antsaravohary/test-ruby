require "rails_helper"
require "spec_helper"

RSpec.describe SpotsController, type: :request do
  context "a superadmin" do
    let(:superadmin) { create(:superadmin) }
    let!(:place) { create(:place) }
    let!(:spot) { create(:spot, place: place) }

    it "list spots" do
      get spots_url, headers: authorization_header(superadmin), as: :json

      expect(response).to have_http_status(:success)

      collection = body_as_json
      expect(collection).to behave_like_a_jsonapi_collection
      expect(collection["data"].first).to have_type(:spots)
      expect(collection["data"].size).to eq(1)
    end

    it "show spot" do
      get spot_url(spot), headers: authorization_header(superadmin), as: :json

      expect(response).to have_http_status(:success)

      resource = body_as_json

      expect(resource).to behave_like_a_jsonapi_resource
      expect(resource["data"]).to have_type(:spots)
    end
  end
end
