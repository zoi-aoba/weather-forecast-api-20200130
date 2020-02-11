class ObservedWeathersController < ApplicationController
  require "date"

  def observed_weather
    @observed_weathers = Hash.new
    (1..30).each do |number|
      date = Date.today - number
      @observed_weathers[date] = ObservedWeather.find_by(date: date) if ObservedWeather.exists?(date: date)
    end
    render json: { status: 'SUCCESS', data: @observed_weathers }
  end
end
