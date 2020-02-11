class Requester < ApplicationRecord
  require "httpclient"
  require "json"
  require "date"

  @@app_id = "34ba6cc32f4168e39be785f092ef2114"
  @@location = "35.41,139.45"

  def self.run
    begin
      date = Date.today + 1
      unless Forecast.exsist?(date: date)
        api_url = "https://api.darksky.net/forecast/#{@@app_id}/#{@@location}"
        response = JSON.parse(HTTPClient.get(api_url).body)["daily"]["data"][1]
        date = Time.at(response["time"]).to_s.split(" ").first
        weather = response["icon"]
        highest_temperature = convert_to_celsius(response["temperatureHigh"])
        lowest_temperature = convert_to_celsius(response["temperatureLow"])

        forecast = Forecast.create(date: date, weather: weather, highest_temperature: highest_temperature, lowest_temperature: lowest_temperature)
        Requester.create(success: true, forecast_id: forecast.id)
      end
    rescue => exception
      Requester.create(success: false, name: exception.class, message: exception.message, backtrace: exception.backtrace)
    end
  end

  def self.get_observed_weather
    begin
    (1..30).each do |number|
      time = Time.parse((Date.today - number).to_s).to_i

      unless ObservedWeather.exsist?(date: time)
        api_url = "https://api.darksky.net/forecast/#{@@app_id}/#{@@location},#{time}"
        responses = JSON.parse(HTTPClient.get(api_url).body)["daily"]["data"].first
    
        date = Time.at(responses["time"]).to_s.split(" ").first
        weather = responses["icon"]
        highest_temperature = convert_to_celsius(responses["temperatureHigh"])
        lowest_temperature = convert_to_celsius(responses["temperatureLow"])
      
        observed_weather = ObservedWeather.create(date: date, weather: weather, highest_temperature: highest_temperature, lowest_temperature: lowest_temperature)
        Requester.create(success: true, observed_weather_id: observed_weather.id)
      end
      Requester.create(success: true)
    end
    rescue => exception
      Requester.create(success: false, name: exception.class, message: exception.message, backtrace: exception.backtrace)
    end
  end

  private

  def self.convert_to_celsius(temperature)
    ((temperature - 32) / 1.8).round(1)
  end
end
