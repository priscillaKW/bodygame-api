require 'spec_helper'

describe "Games" do
  describe "GET /organs/:organ_id/games" do
    subject { get("/organs/#{organ_id}/games"); response }

    context "when organ exists" do
      let(:organ)    { create(:organ) }
      let(:organ_id) { organ.id }

      before { create(:game, organ: organ) }

      its(:status) { should eq 200 }
      its(:body)   { should eq organ.games.to_json }
    end

    context "when organ doesn't exist" do
      let(:organ_id) { "not_found" }

      its(:status) { should eq 404 }
      its(:body)   { should be_blank }
    end
  end

  describe "GET /games/:id" do
    subject { get("/games/#{id}"); response }

    context "when game exists" do
      let(:game) { create(:game) }
      let(:id)   { game.id }

      its(:status) { should eq 200 }
      its(:body)   { should eq game.to_json }
    end

    context "when game doesn't exist" do
      let(:id) { "not_found" }

      its(:status) { should eq 404 }
      its(:body)   { should be_blank }
    end
  end
end
