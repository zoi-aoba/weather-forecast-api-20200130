require 'rails_helper'
require 'date'
require 'time'

describe 'Get Forecast API', type: :request do
  FactoryBot.create(:forecast)

  it 'Responseのstatusは200であるか' do
    get '/tommorow_forecast'
    expect(response.status).to eq(200)
  end

  context 'Responseで取得したい情報は正しく返ってきているか' do
    let(:json) do
      get '/tommorow_forecast'
      json = JSON.parse(response.body)['forecast']
    end

    it '天気予報は取得できているか' do
      expect(json).not_to eq nil
    end

    it '天気予報の日時は正しいか' do
      expect(json['date'].split('T').first).to eq(Time.parse((Date.tomorrow).to_s).to_s.split(' ').first)
    end

    it '天気は取得できているか' do
      expect(json['weather']).not_to eq nil
    end

    it '最低気温は取得できているか' do
      expect(json['lowest_temperature']).not_to eq nil
    end

    it '最高気温は取得できているか' do
      expect(json['highest_temperature']).not_to eq nil
    end
  end
end
