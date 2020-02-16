class ObservedWeathersController < ApplicationController
  require "date"

  def observed_weather
    @observed_weathers = Hash.new
    (0..30).each do |number|
      date = Date.today - number
      weathers = ObservedWeather.find_by(date: date)
      @observed_weathers[date] = weathers if weathers
    end
    render json: { status: 'SUCCESS', data: @observed_weathers }
  end
end
