require 'spec_helper'

describe GameScoresController do
  describe "GET /users/:user_id/game_scores" do
    it "routes to #index" do
      get("/users/1/game_scores").should route_to("game_scores#index", user_id: "1")
    end
  end

  describe "POST /users/:user_id/game_scores" do
    it "routes to #create" do
      post("/users/1/game_scores").should route_to("game_scores#create", user_id: "1")
    end
  end

  describe "GET /games_scores/:id" do
    it "routes to #show" do
      get("/game_scores/1").should route_to("game_scores#show", id: "1")
    end
  end
end
