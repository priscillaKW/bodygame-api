require 'spec_helper'

describe GameScoresController do
  describe "GET index" do
    let(:user)  { create(:user) }

    subject { get :index, { user_id: user_id } }

    context "when user has scores" do
      let(:user_id) { user.id }

      before { create(:game_score, user: user) }

      it "assigns the user's scores to @scores variable" do
        subject
        scores = assigns(:scores)
        scores.should be_a(Array)
        scores.each { |s| s.should be_a(GameScore) }
        scores.each { |s| s.user_id.should eq user_id }
      end

      it "returns status 200" do
        subject
        response.status.should eq 200
      end

      it "renders the user's scores as json" do
        subject
        response.body.should eq assigns(:scores).to_json
      end
    end

    context "when user doesn't have scores" do
      let(:user_id) { user.id }

      it "assigns an empty array @scores variable" do
        subject
        assigns(:scores).should be_a(Array)
        assigns(:scores).should be_empty
      end

      it "returns status 200" do
        subject
        response.status.should eq 200
      end
    end

    context "when user doesn't exist" do
      let(:user_id) { "not_found" }

      it "assigns nil to the @scores variable" do
        subject
        assigns(:scores).should be_nil
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

  describe "POST create" do
    let(:user)  { create(:user) }
    let(:organ) { create(:organ) }

    subject { post :create, { user_id: user.id,  game_score: payload } }

    describe "with valid params" do
      let(:payload) { attributes_for(:game_score, user: user, organ_id: organ.id) }

      it "creates a new GameScore" do
        expect { subject }.to change(GameScore, :count).by(1)
      end

      it "assigns a newly created score as @score" do
        subject
        assigns(:score).should be_a(GameScore)
        assigns(:score).should be_persisted
      end

      it "renders the created score" do
        subject
        response.body.should eq assigns(:score).to_json
      end

      it "returns status created" do
        subject
        response.status.should eq 201
      end

      it "returns header location of the created score" do
        subject
        response.headers["Location"].should =~ /#{game_score_path(assigns(:score))}/
      end
    end

    describe "with invalid params" do
      let(:payload) { attributes_for(:game_score, score: nil) }

      it "doesn't create a new GameScore" do
        expect { subject }.to_not change(GameScore, :count)
      end

      it "assigns a invalid score to @score" do
        subject
        assigns(:score).should be_a(GameScore)
        assigns(:score).should_not be_persisted
      end

      it "returns status 422" do
        subject
        response.status.should eq 422
      end

      it "renders the errors" do
        subject
        response.body.should eq assigns(:score).errors.to_json
      end
    end
  end

  describe "GET show" do
    subject { get :show, { id: id } }

    context "when score exists" do
      let(:score) { create(:game_score) }
      let(:id)    { score.id }

      it "assigns the found score to the @score variable" do
        subject
        assigns(:score).should be_a(GameScore)
        assigns(:score).should eq score
      end

      it "returns status 200" do
        subject
        response.status.should eq 200
      end

      it "renders the found score" do
        subject
        response.body.should eq score.to_json
      end
    end

    context "when score doesn't exist" do
      let(:id) { "not_found" }

      it "assings nil to the @score variable" do
        subject
        assigns(:score).should be_nil
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
