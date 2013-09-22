require 'spec_helper'

describe CompletedGamesController do
  describe "GET /users/:user_id/completed_games" do
    it "routes to #index" do
      get("/users/1/completed_games").should route_to("completed_games#index", user_id: "1")
    end
  end

  describe "POST /users/:user_id/completed_games" do
    it "routes to #create" do
      post("/users/1/completed_games").should route_to("completed_games#create", user_id: "1")
    end
  end
end
