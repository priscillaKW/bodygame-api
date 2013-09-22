require "spec_helper"

describe UsersController do
  describe "POST /users" do
    it "routes to #create" do
      post("/users").should route_to("users#create")
    end
  end

  describe "GET /users/:id" do
    it "routes to #show" do
      get("/users/1").should route_to("users#show", id: "1")
    end
  end
end
