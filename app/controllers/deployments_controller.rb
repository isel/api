class DeploymentsController < ApplicationController

  def list
    #['continuous deployment', 'developer']
    #['fixed', 'scalable']
    #@deployments = DeploymentRepo.new.all(params[:author])
    @deployments = Deployment.all

    #render json: @deployments
    #render xml: @deployments
    #render html: @deployments
  end

end
