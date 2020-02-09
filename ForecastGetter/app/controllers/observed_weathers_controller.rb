class ObservedWeathersController < ApplicationController
  require "date"

  def past
    @observed_weathers = []
    (1..3).each do |number|
      date = Date.today
      @observed_weathers.push(ObservedWeather.find_by(date: date))
    end
    render json: { status: 'SUCCESS', data: @observed_weathers }
  end
end
