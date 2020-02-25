class ObservedWeathersController < ApplicationController
  require 'date'

  def render_observed_weather
    observed_weathers = {}
    (Date.today..Date.today - 30).each do |date|
      weathers = ObservedWeather.find_by(date: date)
      observed_weathers[date] = weathers if weathers
    end
    render json: { status: 'success', observed_weathers: observed_weathers }
  end
end
