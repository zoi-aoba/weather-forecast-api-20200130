Rails.application.routes.draw do
  get "tommorow_forecast", to: "forecasts#get_tomorrow_forecast"
  get "get_observed_weather", to: "observed_weathers#get_observed_weather"
end
