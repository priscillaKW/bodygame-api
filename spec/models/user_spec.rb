require 'spec_helper'

describe User do
  describe "#valid?" do
    subject { user.valid? }

    context "when the user is valid" do
      let(:user) { build(:user) }

      it { should be_true }
    end

    context "when the user is invalid" do
      context "because username is blank" do
        let(:user) { build(:user, username: "") }

        it { should be_false }
      end

      context "because username is not uniquiness" do
        let(:username) { "uniquiness" }
        let(:user)     { build(:user, username: username) }

        before { create(:user, username: username) }

        it { should be_false }
      end

      context "because password is blank" do
        let(:user) { build(:user, password: "") }

        it { should be_false }
      end
    end
  end
end
