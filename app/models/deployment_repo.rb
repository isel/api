require_relative 'deployment'

class DeploymentRepo

  def all
    [
      Deployment.new('1', 'deployment 1'),
      Deployment.new('2', 'deployment 2'),
      Deployment.new('3', 'deployment 3'),
      Deployment.new('4', 'deployment 4'),
    ]
  end

end