require 'spec_helper'

describe LoginsController do
  describe "POST /login" do
    it "routes to #login" do
      post("/login").should route_to("logins#login")
    end
  end
end
