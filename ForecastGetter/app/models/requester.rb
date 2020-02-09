class Requester < ApplicationRecord
  require "httpclient"
  require "json"

  def self.run
    puts "Start Requesting"
    begin
      app_id = "34ba6cc32f4168e39be785f092ef2114"
      location = "35.41,139.45"
      api_url = "https://api.darksky.net/forecast/#{app_id}/#{location}"
      res = HTTPClient.get(api_url)
      response = JSON.parse(res.body)["daily"]["data"].first

      date = Time.at(response["time"]).to_s.split(" ").first
      weather = response["icon"]
      highest_temperature = convert_to_celsius(response["temperatureHigh"])
      lowest_temperature = convert_to_celsius(response["temperatureLow"])

      unless Forecast.find_by(date: date)
        forecast = Forecast.create(date: date, weather: weather, highest_temperature: highest_temperature, lowest_temperature: lowest_temperature)
      end

      Requester.create(success: true, forecast_id: forecast.id)
    rescue => exception
      Requester.create(success: false, name: exception.class, message: exception.message, backtrace: exception.backtrace)
    end
  end

  private

  def self.convert_to_celsius(temperature)
    ((temperature - 32) / 1.8).round(1)
  end
end
