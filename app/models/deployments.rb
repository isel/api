require_relative 'right_scale_api'

class Deployments < RightScaleAPI

  def initialize(api = RightAPI.new)
    super(api)
  end

  def all(filters = nil)
    get('deployments').map { |d| Deployment.new(:name => d['nickname']) }
  end

end