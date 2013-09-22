require 'spec_helper'

describe "Logins" do
  describe "POST /login" do
    subject { post("/login", { login: payload }); response }

    context "when user exists" do
      context "and password matches" do
        let(:user)    { create(:user) }
        let(:payload) { { username: user.username, password: user.password } }

        its(:status) { should eq 200 }
        its(:body)   { should eq user.to_json }
      end

      context "and password doesn't match" do
        let(:user)    { create(:user) }
        let(:payload) { { username: user.username, password: user.password + "invalid" } }

        its(:status) { should eq 401}
      end
    end

    context "when user doesn't exists" do
      let(:payload) { { username: "im_not_exist", password: "dont_you_know_me" } }

      its(:status) { should eq 401}
    end
  end
end
