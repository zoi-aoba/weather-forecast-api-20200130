Rails.application.routes.draw do
  get "tommorow_forecast", to: "forecasts#tomorrow_forecast"
end
