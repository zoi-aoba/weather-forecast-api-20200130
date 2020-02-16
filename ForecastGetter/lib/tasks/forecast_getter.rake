namespace :forecast_getter do
  task run: [:environment] do
    Requester.get_forecast
  end
end

namespace :observed_getter do
  task run: [:environment] do
    Requester.get_observed_weather
  end
end
