class Deployment
  extend ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Serializers::Xml

  attr_accessor :attributes
  attr_accessor :name

  def initialize(attributes = {})
    @attributes = attributes
    @name = attributes[:name]
  end

end