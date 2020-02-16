class ForecastsController < ApplicationController
  require "date"

  # 認証済みのユーザーしかAPIを叩いて欲しくない
  def tomorrow_forecast
    tomorrow = Date.today + 1
    @forecast = Forecast.find_by(date: tomorrow)
    render json: { status: 'SUCCESS', data: @forecast }
  end
end
