class ForecastsController < ApplicationController
  require "date"

    # 認証済みのユーザーからしかAPIを叩いて欲しくない気がする
  def tomorrow_forecast
    tomorrow = Date.today + 1
    @forecast = Forecast.find_by(date: tomorrow)
    render json: { status: 'SUCCESS', data: @forecast }
  end
end
