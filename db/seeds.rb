require "httpclient"
require "json"

app_id = "34ba6cc32f4168e39be785f092ef2114"
location = "35.41,139.45"
time = ",2020-01-09T17:00:00"
# https://darksky.net/dev/docs#time-machine-request
api_url = "https://api.darksky.net/forecast/#{app_id}/#{location}?exclude=current,flags"
# api_url = "https://api.darksky.net/forecast/#{app_id}/#{location}#{time}?exclude=current,flags"
res = HTTPClient.get(api_url)

Forecast.create!(date: Time.at(JSON.parse(res.body)["currently"]["time"]))