require 'spec_helper'
include ApplicationHelper

describe DeploymentsController do
  let(:deployments) { Object.new }
  let(:all_deployments) { ['1','2'] }

  render_views

  context "GET 'index'" do

    before(:each) do
      stub(Deployments).new { deployments }
      stub(deployments).all { all_deployments }
    end

    it "should succeed with json format" do
      get 'index', :format => :json

      response.should be_success
      response.headers['Content-Type'].should include 'application/json'
      response.body.should == "[\"1\",\"2\"]"
    end

    it "should succeed with xml format" do
      get 'index', :format => :xml

      response.should be_success
      response.headers['Content-Type'].should include 'application/xml'
      response.body.should include '<string>1</string>'
      response.body.should include '<string>2</string>'
    end

    it "should succeed with html format" do
      get 'index'

      response.should be_success
      response.headers['Content-Type'].should include 'text/html'
      response.body.should include '<td>1</td>'
      response.body.should include '<td>2</td>'
    end

  end

end
