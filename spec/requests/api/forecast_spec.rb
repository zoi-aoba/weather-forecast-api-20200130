require 'rails_helper'
require "date"
require "time"

describe "Get Forecast API", type: :request do
  FactoryBot.create(:forecast)

  it "Responseのstatusは200であるか" do
    get "/tommorow_forecast"
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
  end

  it "Responseで取得したい情報は正しく返ってきているか" do
    get "/tommorow_forecast"
    json = JSON.parse(response.body)
    expect(json['forecast']).not_to eq nil
    expect(json['forecast']["date"].split("T").first).to eq(Time.parse((Date.today + 1).to_s).to_s.split(" ").first)
    expect(json['forecast']["weather"]).not_to eq nil
    expect(json['forecast']["lowest_temperature"]).not_to eq nil
    expect(json['forecast']["highest_temperature"]).not_to eq nil
  end
end
