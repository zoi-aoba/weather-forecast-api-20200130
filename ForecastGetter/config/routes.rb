Rails.application.routes.draw do
  get "tommorow_forecast", to: "forecasts#tomorrow_forecast"
  get "get_observed_weather", to: "observed_weathers#observed_weather"
end
