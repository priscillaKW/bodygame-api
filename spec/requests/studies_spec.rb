require 'spec_helper'

describe "Studies" do
  describe "GET /organs/:organ_id/studies" do
    subject { get("/organs/#{organ_id}/studies"); response }

    context "when organ exists" do
      let(:organ)    { create(:organ) }
      let(:organ_id) { organ.id }

      before { create(:study, organ: organ) }

      its(:status) { should eq 200 }
      its(:body)   { should eq organ.studies.to_json }
    end

    context "when organ doesn't exist" do
      let(:organ_id) { "not_found" }

      its(:status) { should eq 404 }
      its(:body)   { should be_blank }
    end
  end

  describe "GET /studies/:id" do
    subject { get("/studies/#{id}"); response }

    context "when study exists" do
      let(:study) { create(:study) }
      let(:id)    { study.id }

      its(:status) { should eq 200 }
      its(:body)   { should eq study.to_json }
    end

    context "when study doesn't exist" do
      let(:id) { "not_found" }

      its(:status) { should eq 404 }
      its(:body)   { should be_blank }
    end
  end
end
