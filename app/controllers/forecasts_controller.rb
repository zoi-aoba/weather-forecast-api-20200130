class ForecastsController < ApplicationController
  require 'date'

  def render_tomorrow_forecast
    @forecast = Forecast.find_by(date: Date.tomorrow)
    if @forecast
      render json: { status: 'success', forecast: @forecast }
    else
      render json: { status: 'error' }
    end
  end
end
