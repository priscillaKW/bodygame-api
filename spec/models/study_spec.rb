require 'spec_helper'

describe Study do
  describe "#valid?" do
    subject { study.valid? }

    context "when its valid" do
      let(:study) { build(:study) }

      it { should be_true }

      context "when content_url is blank" do
        let(:study) { build(:study, content_url: "") }

        it { should be_true }
      end
    end

    context "when its invalid" do
      context "because content is blank" do
        let(:study) { build(:study, content: "") }

        it { should be_false }
      end
    end
  end
end
