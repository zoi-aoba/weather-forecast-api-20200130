require "httpclient"
require "json"

app_id = "34ba6cc32f4168e39be785f092ef2114"
location = "35.41,139.45"
# https://darksky.net/dev/docs#time-machine-request
api_url = "https://api.darksky.net/forecast/34ba6cc32f4168e39be785f092ef2114/42.3601,-71.0589,255657600?exclude=currently,flags"
res = HTTPClient.get(api_url)
puts JSON.parse(res.body)["daily"]