require 'spec_helper'

describe UsersController do
  describe "GET show" do
    subject { get :show, { id: id } }

    describe "when user exists" do
      let(:user) { create(:user) }
      let(:id)   { user.id }

      it "assigns the found user to the @user variable" do
        subject
        assigns(:user).should be_a(User)
        assigns(:user).should eq user
      end

      it "returns status 200" do
        subject
        response.status.should eq 200
      end

      it "renders the found user" do
        subject
        response.body.should eq user.to_json
      end
    end

    describe "when user doens't exist" do
      let(:id) { 121212 }

      it "assigns nil to the @user variable" do
        subject
        assigns(:user).should be_nil
      end

      it "returns status 404" do
        subject
        response.status.should eq 404
      end
    end
  end

  describe "POST create" do
    subject { post :create, { user: payload } }

    describe "with valid params" do
      let(:payload) { attributes_for(:user) }

      it "creates a new User" do
        expect { subject }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        subject
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "renders the created user" do
        subject
        response.body.should eq assigns(:user).to_json
      end

      it "returns status created" do
        subject
        response.status.should eq 201
      end

      it "returns header location of the created user" do
        subject
        response.headers["Location"].should =~ /#{user_path(assigns(:user))}/
      end
    end

    describe "with invalid params" do
      let(:payload) { attributes_for(:user, username: "") }

      it "doesn't create a new User" do
        expect { subject }.to change(User, :count).by(0)
      end

      it "assigns a invalid user as @user" do
        subject
        assigns(:user).should be_a(User)
        assigns(:user).should_not be_persisted
      end

      it "returns status 422" do
        subject
        response.status.should eq 422
      end

      it "renders the errors" do
        subject
        response.body.should eq assigns(:user).errors.to_json
      end
    end
  end
end
