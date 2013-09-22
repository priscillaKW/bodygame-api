require 'spec_helper'

describe StudiesController do
  describe "GET /studies/:id" do
    it "routes to #show" do
      get("/studies/1").should route_to("studies#show", id: "1")
    end
  end

  describe "GET /organs/:organ_id/studies" do
    it "routes to #index" do
      get("/organs/1/studies").should route_to("studies#index", organ_id: "1")
    end
  end
end
