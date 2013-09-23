require 'spec_helper'

describe CompletedGamesController do
  describe "GET index" do
    subject { get :index, { user_id: user_id } }

    context "when user exists" do
      let(:user)    { create(:user) }
      let(:user_id) { user.id }

      context "and has completed games" do
        before { create(:completed_game, user: user) }

        it "assigns the user's completed games to the @games variable" do
          subject
          assigns(:games).should be_a(Array)
          assigns(:games).should_not be_empty
          assigns(:games).each { |g| g.should be_a(CompletedGame) }
        end

        it "returns status 200" do
          subject
          response.status.should eq 200
        end

        it "renders the user's completed games as json" do
          subject
          response.body.should eq assigns(:games).to_json
        end
      end

      context "and doesn't have completed games" do
        it "assigns an empty array the @games variable" do
          subject
          assigns(:games).should be_a(Array)
          assigns(:games).should be_empty
        end

        it "returns status 200" do
          subject
          response.status.should eq 200
        end

        it "renders an emtpy array as json" do
          subject
          response.body.should eq [].to_json
        end
      end
    end

    context "when user doesn't exist" do
      let(:user_id) { "not_found" }

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

  pending "POST create"
end
