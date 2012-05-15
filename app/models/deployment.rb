require_relative 'server'

class Deployment
  attr_reader :id
  attr_reader :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def servers
    [
      Server.new("#{id}1", "server #{id}1"),
      Server.new("#{id}2", "server #{id}2"),
      Server.new("#{id}3", "server #{id}3"),
    ]
  end

end