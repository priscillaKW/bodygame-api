require 'spec_helper'

describe Organ do
  describe "autosave studies" do
    let(:organ) { build(:organ) }

    context "when studies is empty" do
      it "should not save any study" do
        organ.save
        organ.studies.should be_empty

        Study.count.should eq 0
      end
    end

    context "when there are studies to persit" do
      it "should persist the studies" do
        organ.studies << build(:study)
        organ.save
        organ.studies.should have(1).item

        Study.count.should eq 1
      end
    end
  end

  describe "#valid?" do
    subject { organ.valid? }

    context "when the organ is valid" do
      let(:organ) { build(:organ) }

      it { should be_true }
    end

    context "when the organ is invalid" do
      context "because name is blank" do
        let(:organ) { build(:organ, name: "") }

        it { should be_false }
      end
    end
  end
end

