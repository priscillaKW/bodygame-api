require 'spec_helper'

describe "Completed Games" do
  describe "GET /users/:user_id/completed_games" do
    subject { get("/users/#{user_id}/completed_games"); response }

    context "when user exists" do
      let(:user)    { create(:user) }
      let(:user_id) { user.id }

      before { create(:completed_game, user: user) }

      its(:status) { should eq 200 }
      its(:body)   { should eq user.completed_games.to_json }
    end

    context "when user doens't exist" do
      let(:user_id) { "not_found" }

      its(:status) { should eq 404 }
      its(:body)   { should be_blank }
    end
  end

  pending "POST /users/:user_id/completed_games"
end
