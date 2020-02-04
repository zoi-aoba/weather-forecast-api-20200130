class ForecastsController < ApplicationController

  def today_forecast
    today = Time.now.to_s.split("-")
    @forecast = Forecast.where(year: today.first, month: today[1], day: today[2])
    render json: { status: 'SUCCESS', data: @forecast }
  end

  def get_forecast
    year = params[:year].to_s
    month = params[:month].to_s
    day = params[:day].to_s

    @forecast = Forecast.where(year: year, month: month, day: day)
    render json: { status: 'SUCCESS', data: @forecast }
  end

  private
end
