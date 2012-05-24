class Deployment
  include ActiveModel::Serializers::JSON
  include ActiveModel::Serializers::Xml

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def attributes
    { 'name' => name }
  end

end