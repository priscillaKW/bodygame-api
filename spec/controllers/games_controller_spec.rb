require 'spec_helper'

describe GamesController do
  describe "GET index" do
    let(:organ) { create(:organ) }

    subject { get :index, { organ_id: organ_id } }

    context "when organ has games" do
      let(:organ_id) { organ.id }

      before { create(:game, organ: organ) }

      it "assigns the organ's games to @games variable" do
        subject
        assigns(:games).should be_a(Array)
        assigns(:games).each { |g| g.should be_a(Game) }
      end

      it "returns status 200" do
        subject
        response.status.should eq 200
      end

      it "renders the organ's games as json" do
        subject
        response.body.should eq assigns(:games).to_json
      end
    end

    context "when organ doesn't have games" do
      let(:organ_id) { organ.id }

      it "assigns an empty array @games variable" do
        subject
        assigns(:games).should be_a(Array)
        assigns(:games).should be_empty
      end

      it "returns status 200" do
        subject
        response.status.should eq 200
      end

      it "renders an empty array as json" do
        subject
        response.body.should eq [].to_json
      end
    end

    context "when organ doesn't exist" do
      let(:organ_id) { "not_found" }

      it "assigns nil to the @games variable" do
        subject
        assigns(:games).should be_nil
      end

      it "returns status 404" do
        subject
        response.status.should eq 404
      end

      it "renders nothing" do
        subject
        response.body.should be_blank
      end
    end
  end

  describe "GET show" do
    subject { get :show, { id: game_id } }

    context "when game exists" do
      let(:game)    { create(:game) }
      let(:game_id) { game.id }

      it "assigns the found game to the @game variable" do
        subject
        assigns(:game).should be_a(Game)
      end

      it "returs status 200" do
        subject
        response.status.should eq 200
      end

      it "renders the found game as json" do
        subject
        response.body.should eq assigns(:game).to_json
      end
    end

    context "when game doesn't exist" do
      let(:game_id) { "not_found" }

      it "assigns nil to the @game variable" do
        subject
        assigns(:game).should be_nil
      end

      it "returns status 404" do
        subject
        response.status.should eq 404
      end

      it "renders nothing" do
        subject
        response.body.should be_blank
      end
    end
  end
end
