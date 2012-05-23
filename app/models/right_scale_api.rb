require 'json'
require_relative 'settings'
require_relative 'rightapi'
require_relative 'process'

class RightScaleAPI

  def initialize(api)
    @sleep_time = 5
    @timeout = 5*60

    @right_api = api
    @right_api.log = true
    @right_api.login(:username => USERNAME, :password => PASSWORD, :account => ACCOUNT)
  end

  def successful?
    return false if @right_api.headers.nil? || @right_api.code.nil?

    code = @right_api.code.to_s
    code = code.split(' ').first if code.include?(' ')

    code != '422' && code != '503'
  end

  def get(request, query_string = nil)
    response = nil
    Helpers::Process.new(@sleep_time).run("executing #{request}", @timeout) do
      response = @right_api.send("#{request}.js?#{query_string}", 'get', {:accept => :json})
      successful?
    end
    JSON.parse(response)
  end

  def post(request)
    Helpers::Process.new(@sleep_time).run("executing #{request}", @timeout) do
      @right_api.send(request, "post")
      successful?
    end
  end

end

