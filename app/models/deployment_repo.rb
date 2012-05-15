require_relative 'deployment'

class DeploymentRepo

  def all(author = nil)
    author.nil? ? [
      Deployment.new('1', 'deployment 1'),
      Deployment.new('2', 'deployment 2'),
      Deployment.new('3', 'deployment 3'),
      Deployment.new('4', 'deployment 4'),
    ] : [Deployment.new('1', 'deployment 1')]
  end

end