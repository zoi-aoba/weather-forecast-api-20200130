class ForecastsController < ApplicationController

  def tomorrow_forecast
    today = Time.now.to_s.split(" ").first
    @forecast = Forecast.find_by(date: today)
    render json: { status: 'SUCCESS', data: @forecast }
  end
end
