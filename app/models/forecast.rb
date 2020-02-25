class Forecast < ApplicationRecord
  validates :highest_temperature, presence: true, numericality: true
  validates :lowest_temperature, presence: true, numericality: true
  validates :weather, presence: true
  validates :date, presence: true

  def self.format_data(response)
    raise 'The Response is invalid' unless JSON.parse(response.body).key?('latitude')
    formatted_response = JSON.parse(response.body)['daily']['data'][1]
    forecast = {}
    forecast['date'] = Time.at(formatted_response['time']).to_s.split(' ').first
    forecast['weather'] = formatted_response['icon']
    forecast['highest_temperature'] = convert_celsius(formatted_response['temperatureHigh'])
    forecast['lowest_temperature'] = convert_celsius(formatted_response['temperatureLow'])
    forecast
  end

  def self.convert_celsius(temperature)
    ((temperature - 32) / 1.8).round(1)
  end
end
