class Requester < ApplicationRecord
  require "httpclient"
  require "json"
  require "date"

  @@app_id = "/34ba6cc32f4168e39be785f092ef2114"
  @@location = "/35.41,139.45"
  @@api_url = "https://api.darksky.net/forecast"

  def self.get_forecast
    begin
      # おかしい
      unless Forecast.exists?(date: Date.today + 1)
        puts Date.today + 1
        response = HTTPClient.get(@@api_url + @@app_id + @@location)
        unless response.status == 200
          raise "The Response status is #{response.status}"
        end
        unless JSON.parse(response.body).has_key?("latitude")
          raise "The Response status is invalid"
        end
        formatted_response = format_forecast_response(response)
        # 日本時間に変更する
        date = Time.at(formatted_response["time"]).to_s.split(" ").first
        weather = formatted_response["icon"]
        highest_temperature = convert_to_celsius(formatted_response["temperatureHigh"])
        lowest_temperature = convert_to_celsius(formatted_response["temperatureLow"])

        forecast = Forecast.create(date: date, weather: weather, highest_temperature: highest_temperature, lowest_temperature: lowest_temperature)
        Requester.create(success: true, forecast_id: forecast.id)
      else
        Requester.create(success: true)
      end
    rescue => exception
      Requester.create(success: false, name: exception.class, message: exception.message, backtrace: exception.backtrace)
    end
  end

  def self.get_observed_weather
    begin
    (0..30).each do |reverse_days|
      unless ObservedWeather.exists?(date: Date.today - reverse_days)
        time = "," + Time.parse((Date.today - reverse_days).to_s).to_i.to_s
        response = HTTPClient.get(@@api_url + @@app_id + @@location + time)
        unless response.status == 200
          raise "The Response status is #{response.status}"
        end
        unless JSON.parse(response.body).has_key?("latitude")
          raise "The Response status is invalid"
        end
        formatted_response = format_observed_weather_response(response)
        date = Time.at(formatted_response["time"]).to_s.split(" ").first
        weather = formatted_response["icon"]
        highest_temperature = convert_to_celsius(formatted_response["temperatureHigh"])
        lowest_temperature = convert_to_celsius(formatted_response["temperatureLow"])
      
        observed_weather = ObservedWeather.create(date: date, weather: weather, highest_temperature: highest_temperature, lowest_temperature: lowest_temperature)
        Requester.create(success: true, observed_weather_id: observed_weather.id)
      else
        Requester.create(success: true)
      end
    end
    rescue => exception
      Requester.create(success: false, name: exception.class, message: exception.message, backtrace: exception.backtrace)
    end
  end

  private
  def self.convert_to_celsius(temperature)
    ((temperature - 32) / 1.8).round(1)
  end

  def self.format_forecast_response(response)
    JSON.parse(response.body)["daily"]["data"].first
  end

  def self.format_observed_weather_response(response)
    JSON.parse(response.body)["daily"]["data"].first
  end
end
