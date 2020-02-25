class Requester < ApplicationRecord
  require 'httpclient'
  require 'json'
  require 'date'

  LOCATION = '/35.41,139.45'
  API_URL = 'https://api.darksky.net/forecast'

  def self.fetch_forecast
    unless Forecast.exists?(date: Date.tomorrow)
      response = get_data(make_forecast_url(API_URL, LOCATION))
      check_response(response)
      contents = Forecast.format_data(response)
      ActiveRecord::Base.transaction do
        forecast = Forecast.create!(date: contents['date'],
                                   weather: contents['weather'],
                                   highest_temperature: contents['highest_temperature'],
                                   lowest_temperature: contents['lowest_temperature'])
        Requester.create!(success: true, forecast_id: forecast.id)
      end
    else
      Requester.create(success: true)
    end
    rescue => exception
      Requester.create(success: false, name: exception.class, message: exception.message, backtrace: exception.backtrace)
  end

  def self.fetch_observed_weather
    ((Date.today - 30)..Date.today).each do |past_day|
      unless ObservedWeather.exists?(date: past_day)
        response = HTTPClient.get(make_observed_weather_url(API_URL, LOCATION, past_day))
        check_response(response)
        weather = ObservedWeather.format_data(response)
        ActiveRecord::Base.transaction do
          observed_weather = ObservedWeather.create!(date: weather['date'],
                                                     weather: weather['weather'],
                                                     highest_temperature: weather['highest_temperature'],
                                                     lowest_temperature: weather['lowest_temperature'])
          Requester.create!(success: true, observed_weather_id: observed_weather.id)
        end
      else
        Requester.create(success: true)
      end
    end
    rescue => exception
      Requester.create(success: false, name: exception.class, message: exception.message, backtrace: exception.backtrace)
  end

  private

  def self.get_data(url)
    HTTPClient.get(url)
  end

  def self.make_forecast_url(api_url, location)
    api_url + Rails.application.credentials.aws[:app_id] + location
  end

  def self.make_observed_weather_url(api_url, location, past_day)
    time = ',' + Time.parse(past_day.to_s).to_i.to_s
    api_url + Rails.application.credentials.aws[:app_id] + location + time
  end

  def self.check_response(response)
    unless response.status == 200
      raise "The Response status is #{response.status}"
    end
    unless JSON.parse(response.body).key?('latitude')
      raise 'The Response is invalid'
    end
  end
end
