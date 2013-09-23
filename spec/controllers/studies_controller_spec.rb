require 'spec_helper'

describe StudiesController do
  describe "GET index" do
    let(:organ) { create(:organ) }

    subject { get :index, { organ_id: organ_id } }

    context "when organ has studies" do
      let(:organ_id) { organ.id }

      before { create(:study, organ: organ) }

      it "assigns the organ's studies to the @studies variable" do
        subject
        assigns(:studies).should be_a(Array)
        assigns(:studies).should_not be_empty
        assigns(:studies).each { |s| s.should be_a(Study) }
      end

      it "returns status 200" do
        subject
        response.status.should eq 200
      end

      it "renders the organ's studies as json" do
        subject
        response.body.should eq assigns(:studies).to_json
      end
    end

    context "when organ doesn't have studies" do
      let(:organ_id) { organ.id }

      it "assigns an empty array to the @studies variable" do
        subject
        assigns(:studies).should be_a(Array)
        assigns(:studies).should be_empty
      end

      it "returns status 200" do
        subject
        response.status.should eq 200
      end

      it "renders an empty array as json" do
        subject
        response.body.should eq [].to_json
      end
    end

    context "when organ doesn't exist" do
      let(:organ_id) { "not_found" }

      it "assigns nil to the @studies variable" do
        subject
        assigns(:studies).should be_nil
      end

      it "returns status 404" do
        subject
        response.status.should eq 404
      end

      it "renders nothing" do
        subject
        response.body.should be_blank
      end
    end
  end

  describe "GET show" do
    subject { get :show, { id: id } }

    context "when study exists" do
      let(:study) { create(:study) }
      let(:id)    { study.id }

      it "assigns the found study to the @study variable" do
        subject
        assigns(:study).should be_a(Study)
      end

      it "returns status 200" do
        subject
        response.status.should eq 200
      end

      it "renders the found study as json" do
        subject
        response.body.should eq assigns(:study).to_json
      end
    end

    context "when study doesn't exist" do
      let(:id) { "not_found" }

      it "assigns nil to the @study variable" do
        subject
        assigns(:study).should be_nil
      end

      it "returns status 404" do
        subject
        response.status.should eq 404
      end

      it "renders nothing" do
        subject
        response.body.should be_blank
      end
    end
  end
end
