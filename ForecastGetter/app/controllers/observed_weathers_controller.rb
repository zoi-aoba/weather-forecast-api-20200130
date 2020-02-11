class ObservedWeathersController < ApplicationController
  require "date"

  def observed_weather
    #いい感じに書き換えられる　範囲指定
    @observed_weathers = []
    (1..3).each do |number|
      date = Date.today
      @observed_weathers.push(ObservedWeather.find_by(date: date))
    end
    render json: { status: 'SUCCESS', data: @observed_weathers }
  end
end
