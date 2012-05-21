class DeploymentsController < ApplicationController

  def index
    @deployments = Deployments.new.all({ 'type' => params[:type], 'size' => params[:size]})

    return_formatted(@deployments)
  end

end
