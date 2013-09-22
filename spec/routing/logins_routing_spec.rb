require 'spec_helper'

describe LoginsController do
  describe "POST /login" do
    it "routes to #create" do
      post("/login").should route_to("logins#create")
    end
  end
end
