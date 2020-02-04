Rails.application.routes.draw do
  get "today_forecast", to: "forecasts#today_forecast"
  get "get_forecast", to: "forecasts#get_forecast"
end
