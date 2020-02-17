require "httpclient"
require "json"
require "date"

app_id = "/34ba6cc32f4168e39be785f092ef2114"
location = "/35.41,139.45"
api_url = "https://api.darksky.net/forecast"

response = HTTPClient.get(api_url + app_id + location)

JSON.parse(response.body)["daily"]["data"].each do |response|
  puts Time.at(response["time"])
end

# 2020-02-18 00:00:00 +0900
# 2020-02-19 00:00:00 +0900
# 2020-02-20 00:00:00 +0900
# 2020-02-21 00:00:00 +0900
# 2020-02-22 00:00:00 +0900
# 2020-02-23 00:00:00 +0900
# 2020-02-24 00:00:00 +0900
# 2020-02-25 00:00:00 +0900