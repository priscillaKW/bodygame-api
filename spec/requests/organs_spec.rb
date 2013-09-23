require 'spec_helper'

describe "Organs" do
  describe "GET /organs" do
    subject { get("/organs"); response }

    before { create(:organ) }

    its(:status) { should eq 200 }
    its(:body)   { should eq Organ.all.entries.to_json }
  end

  describe "GET /organs/:id" do
    subject { get("/organs/#{id}"); response }

    context "when organ exists" do
      let(:organ) { create(:organ) }
      let(:id)    { organ.id }

      its(:status) { should eq 200 }
      its(:body)   { should eq organ.to_json }
    end

    context "when organ doens't exist" do
      let(:id) { "not_found" }

      its(:status) { should eq 404 }
      its(:body)   { should be_blank }
    end
  end

  describe "GET /organs/:id" do
    subject { get("/organs/#{id}"); response }

    context "when organ exists" do
      let(:organ) { create(:organ) }
      let(:id)    { organ.id }

      its(:status) { should eq 200 }
      its(:body)   { should eq organ.to_json }
    end

    context "when organ doesn't exists" do
      let(:id) { "not_found" }

      its(:status) { should eq 404 }
      its(:body)   { should be_blank }
    end
  end
end
