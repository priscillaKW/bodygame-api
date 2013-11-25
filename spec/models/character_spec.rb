require 'spec_helper'

describe Character do
  describe "#valid?" do
    subject { c.valid? }

    context "when the character is valid" do
      let(:c) { build(:character) }

      it { should be_true }
    end

    context "when the character is invalid" do
      context "because kind is invalid" do
        let(:c) { build(:character, kind: "invalid") }

        it { should be_false }
      end

      context "because kind in blank" do
        let(:c) { build(:character, kind: "") }

        it { should be_false}
      end
    end
  end
end
