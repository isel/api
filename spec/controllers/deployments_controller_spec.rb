require 'spec_helper'
include ApplicationHelper

describe DeploymentsController do
  let(:deployments) { Object.new }
  let(:all_deployments) do
    [
        Deployment.new(:name => 'name1'),
        Deployment.new(:name => 'name2')
    ]
  end

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
      response.body.should == "[{\"attributes\":{\"name\":\"name1\"},\"name\":\"name1\"},{\"attributes\":{\"name\":\"name2\"},\"name\":\"name2\"}]"
    end

    it "should succeed with xml format" do
      get 'index', :format => :xml

      response.should be_success
      response.headers['Content-Type'].should include 'application/xml'
      response.body.should include '<name>name1</name>'
      response.body.should include '<name>name2</name>'
    end

    it "should succeed with html format" do
      get 'index'

      response.should be_success
      response.headers['Content-Type'].should include 'text/html'
      response.body.should include '<td>name1</td>'
      response.body.should include '<td>name2</td>'
    end

  end

end
