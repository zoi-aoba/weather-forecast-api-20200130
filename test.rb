require "httpclient"
require "json"
require "date"

app_id = "34ba6cc32f4168e39be785f092ef2114"
location = "35.41,139.45"
time = Time.parse((Date.today - 10).to_s).to_i
puts Time.at(time)

api_url = "https://api.darksky.net/forecast/#{app_id}/#{location},#{time}"
responses = JSON.parse(HTTPClient.get(api_url).body)

puts Time.at(responses["daily"]["data"].first["time"])
puts responses["daily"]["data"].first["icon"]
puts responses["daily"]["data"].first["temperatureHigh"]
puts responses["daily"]["data"].first["temperatureLow"]




