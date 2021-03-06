class ObservedWeather < ApplicationRecord
  validates :highest_temperature, presence: true, numericality: true
  validates :lowest_temperature, presence: true, numericality: true
  validates :weather, presence: true
  validates :date, presence: true

  def self.format_data(response)
    raise 'The Response is invalid' unless JSON.parse(response.body).key?('latitude')
    formatted_response = JSON.parse(response.body)['daily']['data'].first
    weather = {}
    weather['date'] = Time.at(formatted_response['time']).to_s.split(' ').first
    weather['weather'] = formatted_response['icon']
    weather['highest_temperature'] = convert_celsius(formatted_response['temperatureHigh'])
    weather['lowest_temperature'] = convert_celsius(formatted_response['temperatureLow'])
    weather
  end

  def self.convert_celsius(temperature)
    ((temperature - 32) / 1.8).round(1)
  end
end
