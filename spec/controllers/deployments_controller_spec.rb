require 'spec_helper'

describe DeploymentsController do #, :type => :controller do

  describe "GET 'list'" do
    it "returns http success" do
      get 'list'
      response.should be_success
      response.should have_selector("td",
        :content => "#{@base_title} | Home")
    end
  end

end
