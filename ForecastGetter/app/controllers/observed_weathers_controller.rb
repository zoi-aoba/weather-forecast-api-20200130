class ObservedWeathersController < ApplicationController
  require "date"

  def observed_weather
    # 範囲設定をいい感じに書き換える
    @observed_weathers = []
    (1..30).each do |number|
      date = Date.today
      @observed_weathers.push(ObservedWeather.find_by(date: date)) if ObservedWeather.find_by(date: date).exsist?
    end
    render json: { status: 'SUCCESS', data: @observed_weathers }
  end
end
