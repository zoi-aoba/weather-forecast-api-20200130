require 'rails_helper'
require 'date'

describe 'Get Observed Weatehr API', type: :request do
  ((Date.today - 30)..Date.today).each do |date|
    FactoryBot.create(:observed_weather, date: date)
  end

  it 'Responseのstatusは200であるか' do
    get '/get_observed_weather'
    expect(response.status).to eq(200)
  end

  it 'Responseで取得したい情報は正しく返ってきているか' do
    get '/get_observed_weather'
    json = JSON.parse(response.body)['observed_weathers']
    expect(json).not_to eq nil
    expect(json[Time.parse((Date.today).to_s).to_s.split(' ').first]).not_to eq nil
    expect(json[Time.parse((Date.today - 30).to_s).to_s.split(' ').first]).not_to eq nil
    expect(json[Time.parse((Date.today - 30).to_s).to_s.split(' ').first]['weather']).not_to eq nil
    expect(json[Time.parse((Date.today - 30).to_s).to_s.split(' ').first]['lowest_temperature']).not_to eq nil
    expect(json[Time.parse((Date.today - 30).to_s).to_s.split(' ').first]['highest_temperature']).not_to eq nil
  end
end
