class ObservedWeathersController < ApplicationController
  require "date"

  def get_observed_weather
    @observed_weathers = Hash.new
    (0..30).each do |reverse_days|
      date = Date.today - reverse_days
      weathers = ObservedWeather.find_by(date: date)
      @observed_weathers[date] = weathers if weathers
    end
    render json: { status: "success", observed_weathers: @observed_weathers }
  end
end
