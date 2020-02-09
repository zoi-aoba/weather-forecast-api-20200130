require "httpclient"
require "json"

app_id = "34ba6cc32f4168e39be785f092ef2114"
location = "35.41,139.45"
# https://darksky.net/dev/docs#time-machine-request
api_url = "https://api.darksky.net/forecast/#{app_id}/#{location}"
res = HTTPClient.get(api_url)
puts JSON.parse(res.body)["daily"]["data"].first["temperatureHigh"]