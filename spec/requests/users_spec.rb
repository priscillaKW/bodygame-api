require 'spec_helper'

describe "Users" do
  describe "GET /users/:id" do
    subject { get("/users/#{id}"); response }

    context "when user exist" do
      let(:user) { create(:user) }
      let(:id)   { user.id }

      its(:status) { should eq 200 }
      its(:body)   { should eq user.to_json }
    end

    context "when user doesn't exist" do
      let(:id) { 1212 }

      its(:status) { should eq 404 }
    end
  end

  describe "POST /users" do
    subject { post("/users", { user: payload }); response }

    context "when user is valid" do
      let(:payload) { attributes_for(:user) }

      its(:status) { should eq 201 }
    end

    context "when user is invalid" do
      context "because username is blank" do
        let(:payload) { attributes_for(:user, username: "") }

        its(:status) { should eq 422 }
      end

      context "because password is blank" do
        let(:payload) { attributes_for(:user, password: "") }

        its(:status) { should eq 422 }
      end

      context "because already exists another user with the same username" do
        let(:username) { "someone" }
        let(:payload)  { attributes_for(:user, username: username) }

        before { create(:user, username: username) }

        its(:status) { should eq 422 }
      end
    end
  end
end
