class Server
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :id, :name

  validates_presence_of :id
  validates_presence_of :name
  validates_format_of :id, :with => /[0-9]+/
  validates_length_of :name, :maximum => 500

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def private_ip
    '1.2.3.4'
  end

  def persisted?
    false
  end

end