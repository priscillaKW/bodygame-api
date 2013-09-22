require 'spec_helper'

describe Login do
  describe ".find_by_username" do
    subject { Login.find_by_username(username) }

    context "when user exists" do
      let(:user)     { create(:user) }
      let(:username) { user.username }

      it { should be_a(Login) }

      its(:user) { should eq user }
    end

    context "when user doesn't exists" do
      let(:username) { "somebody" }

      it { should be_nil }
    end
  end

  describe "#initialize" do
    let(:user) { User.new }

    subject { Login.new(user) }

    it "assigns user into @user variable" do
      subject.instance_variable_get("@user").should eq user
    end
  end

  describe "#user" do
    let(:user)  { build(:user) }
    let(:login) { Login.new(user) }

    subject { login.user }

    it { should eq user }
  end

  describe "#verify_password" do
    let(:user)  { build(:user) }
    let(:login) { Login.new(user) }

    subject { login.verify_password(password) }

    context "when password matches" do
      let(:password) { user.password }

      it { should be_true }
    end

    context "when password doesn't match" do
      let(:password) { user.password + "invalid" }

      it { should be_false }
    end
  end
end
