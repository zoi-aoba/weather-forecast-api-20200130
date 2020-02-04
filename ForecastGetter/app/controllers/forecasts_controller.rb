class ForecastsController < ApplicationController
  def index
    @forecasts = Forecast.all
    render json: { status: 'SUCCESS', data: @forecasts}
  end

  def get_forecast_5days
  end
end
