require 'spec_helper'

describe OrgansController do
  describe "GET index" do
    subject { get :index }

    before { create(:organ) }

    it "assigns all organs to the @organs variable" do
      subject
      assigns(:organs).should be_a(Array)
      assigns(:organs).each { |o| o.should be_a(Organ) }
    end

    it "returns status 200" do
      subject
      response.status.should eq 200
    end

    it "renders the all organs" do
      subject
      response.body.should eq Organ.all.entries.to_json
    end
  end

  describe "GET show" do
    subject { get :show, { id: id } }

    context "when organ exists" do
      let(:organ) { create(:organ) }
      let(:id)    { organ.id }

      it "assign the found organ to @ogran variable" do
        subject
        assigns(:organ).should be_a(Organ)
      end

      it "return status 200" do
        subject
        response.status.should eq 200
      end

      it "renders the found organ" do
        subject
        response.body.should eq organ.to_json
      end
    end

    context "when organ doesn't exist" do
      let(:id) { "not_found" }

      it "assigns null to the @organ variable" do
        subject
        assigns(:organ).should be_nil
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
