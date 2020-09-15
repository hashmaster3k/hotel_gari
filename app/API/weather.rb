require 'faraday'
require 'pry'
require 'json'

class Weather

  attr_reader :body

  def initialize
    response = Faraday.get "https://api.weatherbit.io/v2.0/current?city=Denver,CO&key=740a67e52c784d82ad507f463d022391"
    @body = JSON(response.body)
  end

  def city_name
    @body["data"].first['city_name']
  end

  def state_code
    @body["data"].first['state_code']
  end

  def temperature
    @body["data"].first['temp']
  end

  def feels_like
    @body["data"].first['app_temp']
  end

  def cloud_coverage_percent
    @body["data"].first['clouds']
  end

  def weather
    @body["data"].first['weather']
  end

end
