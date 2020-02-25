namespace :root do
  task run: [:environment] do
    Requester.fetch_forecast
  end
end

namespace :root do
  task observed_weather_getter_run: [:environment] do
    Requester.fetch_observed_weather
  end
end
