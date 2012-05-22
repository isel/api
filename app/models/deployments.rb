require_relative 'right_scale_api'

class Deployments < RightScaleAPI

  def initialize(api = RightAPI.new)
    super(api)
  end

  def all(filters)
    found_deployments = get('deployments')
    #found_deployments = [found_deployments] if found_deployments.class == Hash
    #found_deployments.map { |d| Deployment.new(d['nickname']) } unless found_deployments.nil?
  end

end