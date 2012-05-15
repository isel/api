require_relative '../../app/models/deployment_repo'

class DeploymentsController < ApplicationController
  def list
    @deployments = DeploymentRepo.new.all(params[:author])
  end
end
