require 'rails_helper'
require "date"

describe "Get Observed Weatehr API", type: :request do

  (1..30).each do |number|
    date = Date.today - number
    FactoryBot.create(:observed_weather, date: date)
  end

  it "Responseのstatusは200であるか" do
    get "/get_observed_weather"
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
  end

  it "Responseで取得したい情報は正しく返ってきているか" do
    get "/get_observed_weather"
    json = JSON.parse(response.body)
    expect(json['data']).not_to eq nil
    expect(json['data'][Time.parse((Date.today - 1).to_s).to_s.split(" ").first]).not_to eq nil
    expect(json['data'][Time.parse((Date.today - 30).to_s).to_s.split(" ").first]).not_to eq nil
    expect(json['data'][Time.parse((Date.today - 30).to_s).to_s.split(" ").first]["weather"]).not_to eq nil
    expect(json['data'][Time.parse((Date.today - 30).to_s).to_s.split(" ").first]["lowest_temperature"]).not_to eq nil
    expect(json['data'][Time.parse((Date.today - 30).to_s).to_s.split(" ").first]["highest_temperature"]).not_to eq nil
  end
end