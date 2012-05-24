require 'spec_helper'
include ApplicationHelper

describe DeploymentsController do
  let(:deployments) { Object.new }
  let(:all_deployments) do
    [
        Deployment.new('name1'),
        Deployment.new('name2')
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
      puts response.body
      response.body.should == "[{\"deployment\":{\"name\":\"name1\"}},{\"deployment\":{\"name\":\"name2\"}}]"
    end

    it "should succeed with xml format" do
      get 'index', :format => :xml

      response.should be_success
      response.headers['Content-Type'].should include 'application/xml'
      puts response.body
      response.body.should == <<-EOF
<?xml version="1.0" encoding="UTF-8"?>
<deployments type="array">
  <deployment>
    <name>name1</name>
  </deployment>
  <deployment>
    <name>name2</name>
  </deployment>
</deployments>
      EOF
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
