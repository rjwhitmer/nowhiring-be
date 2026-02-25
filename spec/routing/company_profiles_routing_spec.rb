require "rails_helper"

RSpec.describe CompanyProfilesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/company_profiles").to route_to("company_profiles#index")
    end

    it "routes to #show" do
      expect(get: "/company_profiles/1").to route_to("company_profiles#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/company_profiles").to route_to("company_profiles#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/company_profiles/1").to route_to("company_profiles#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/company_profiles/1").to route_to("company_profiles#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/company_profiles/1").to route_to("company_profiles#destroy", id: "1")
    end
  end
end
