require 'spec_helper'

describe CharactersController do
  describe "POST create" do
    let(:user) { create(:user) }

    subject { post :create, { user_id: user.id, character: payload} }

    describe "with valid params" do
      let(:payload) { attributes_for(:character) }

      it "creates a new character" do
        subject
        assigns(:user).character.should be_persisted
      end

      it "assings the newly character as @character" do
        subject
        assigns(:character).should be_a(Character)
      end

      it "renders the updated user" do
        subject
        response.body.should eq assigns(:user).to_json
      end

      it "returns status created" do
        subject
        response.status.should eq 201
      end
    end

    describe "with invalid params" do
      let(:payload) { attributes_for(:character, kind: "invalid") }

      it "returns status 422" do
        subject
        response.status.should eq 422
      end

      it "renders the errors" do
        subject
        response.body.should eq assigns(:character).errors.to_json
      end
    end
  end

  describe "PUT update" do
    subject { put :update, { user_id: user.id, character: payload } }

    context "with valid params" do
      let(:payload) { { current_stage: 1 } }
      let(:user)    { create(:user, character: build(:character)) }

      it "updates current stage from user" do
        subject
        user.reload.character.current_stage.should eq 1
      end

      it "returns 200" do
        subject
        response.status.should eq 200
      end

      it "renders the updates user" do
        subject
        response.body.should eq user.reload.to_json
      end
    end

    context "with invalid params" do
      let(:payload) { { current_stage: 1 } }

      context "because user doesn't exist" do
        let(:user) { build(:user) }

        it "returns 404" do
          subject
          response.status.should eq 404
        end
      end

      context "because user doesn't have character" do
        let(:user) { create(:user) }

        it "returns 404" do
          subject
          response.status.should eq 404
        end
      end
    end
  end
end
