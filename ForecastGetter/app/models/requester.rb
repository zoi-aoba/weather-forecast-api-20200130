class Requester < ApplicationRecord
  require "httpclient"
  require "json"

  def self.run
    puts "Start Requesting"
    city_id = "1850147"
    app_id = "223343a8068a05c3d91e8494cb49101c"
    api_url = "https://api.openweathermap.org/data/2.5/forecast?id=#{city_id}&appid=#{app_id}"
    res = HTTPClient.get(api_url)
    response = JSON.parse(res.body)["list"]

    response.each do |data|
      forecast_data = format_response(data)
      if is_exsist?(forecast_data)
        forecast = Forecast.find_by(year: forecast_data[:year], month: forecast_data[:month], day: forecast_data[:day], hour: forecast_data[:hour])
        forecast.update(temperature: forecast_data[:temperature], weather: forecast_data[:weather])
      else
        Forecast.create(year: forecast_data[:year],
          month: forecast_data[:month],
          day: forecast_data[:day],
          hour: forecast_data[:hour],
          temperature: forecast_data[:temperature],
          weather: forecast_data[:weather]
        )
        end
      end
  end

  def self.format_response (data)
    year = data["dt_txt"].split("-").first.to_i
    month = data["dt_txt"].split("-")[1].to_i
    day = data["dt_txt"].split("-")[2].to_i
    hour = data["dt_txt"].split(" ")[1].split(":").first.to_i
    temperature = data["main"]["temp"]
    weather = data["weather"][0]["main"]

    {year: year, month: month, day: day, hour: hour, temperature: temperature, weather: weather}
  end

  def self.is_exsist?(data)
    Forecast.find_by(year: data[:year], month: data[:month], day: data[:day], hour: data[:hour])
  end
end
