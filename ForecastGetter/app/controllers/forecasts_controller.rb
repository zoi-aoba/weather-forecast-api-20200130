class ForecastsController < ApplicationController
  require "date"

  def get_tomorrow_forecast
    @forecast = Forecast.find_by(date: Date.today + 1)
    if @forecast
      render json: { status: "success", forecast: @forecast }
    else
      render json: { status: "error"}
    end
  end
end
