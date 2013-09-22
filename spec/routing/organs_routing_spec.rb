require 'spec_helper'

describe OrgansController do
  describe "GET /organs" do
    it "routes to #index" do
      get("/organs").should route_to("organs#index")
    end
  end

  describe "GET /organs/:id" do
    it "routes to #show" do
      get("/organs/1").should route_to("organs#show", id: "1")
    end
  end
end
