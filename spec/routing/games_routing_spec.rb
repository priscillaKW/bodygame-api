require 'spec_helper'

describe GamesController do
  describe "GET /games/:id" do
    it "routes to #show" do
      get("/games/1").should route_to("games#show", id: "1")
    end
  end

  describe "GET /organs/:organ_id/games" do
    it "routes to #index" do
      get("/organs/1/games").should route_to("games#index", organ_id: "1")
    end
  end
end
