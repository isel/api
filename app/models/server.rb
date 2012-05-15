class Server
  attr_reader :id
  attr_reader :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def private_ip
    '1.2.3.4'
  end
end