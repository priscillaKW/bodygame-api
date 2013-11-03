require 'spec_helper'

describe GameScore do
  describe "#valid?" do
    subject { game_score.valid? }

    context "when game score is valid" do
      let(:game_score) { build(:game_score) }

      it { should be true }
    end

    context "when game score is invalid" do
      let(:game_score) { build(:game_score, fields) }

      context "because score is nil" do
        let(:fields) { { score: nil } }

        it { should be false}
      end

      context "because game_type is invalid" do
        context "game type is nil" do
          let(:fields) { { game_type: nil } }

          it { should be false }
        end

        context "game type is invalid" do
          let(:fields) { { game_type: "InvalidOne" } }

          it { should be false }
        end
      end

      context "because user is nil" do
        let(:fields) { { user: nil } }

        it { should be false}
      end

      context "because organ is nil" do
        let(:fields) { { organ: nil } }

        it { should be false}
      end
    end
  end
end
