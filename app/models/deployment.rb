require_relative 'server'

class Deployment
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

  def servers
    [
      Server.new({:id => "#{id}1", :name => "server #{id}1"}),
      Server.new({:id => "#{id}2", :name => "server #{id}2"}),
      Server.new({:id => "#{id}3", :name => "server #{id}3"}),
    ]
  end

  def self.all
    [
      Deployment.new({:id => '1', :name => 'deployment 1'}),
      Deployment.new({:id => '2', :name => 'deployment 2'}),
      Deployment.new({:id => '3', :name => 'deployment 3'}),
      Deployment.new({:id => '4', :name => 'deployment 4'}),
    ]
  end

  def persisted?
    false
  end

end