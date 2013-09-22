require 'spec_helper'

describe LoginsController do
  describe "POST login" do
    subject { post :login, { login: payload } }

    context "a valid login" do
      let(:payload) { { username: "me", password: "my_password" } }

      before { User.create!(payload) }

      it "returns 200" do
        subject
        response.status.should eq 200
      end
    end

    context "an invalid login" do
      context "because user doesn't exists" do
        let(:payload) { { username: "not_found", password: "i_dont_known_me" } }

        it "returns 401" do
          subject
          response.status.should eq 401
        end
      end

      context "because password doens't match" do
        let(:user)    { create(:user) }
        let(:payload) { { username: user, password: user.password + "invalid" } }

        it "returns 401" do
          subject
          response.status.should eq 401
        end
      end
    end
  end
end
