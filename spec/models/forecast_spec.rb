require 'rails_helper'
require 'json'

RSpec.describe Forecast, type: :model do
  describe 'convert_celsius' do
    it '摂氏と華氏の変換が正しいか' do
      expect(Forecast.convert_celsius(100)).to eq(37.8)
      expect(Forecast.convert_celsius(100)).to_not eq(100)
    end
  end

  File.open('spec/responses/valid_forecast_response.json') do |json|
    @valid_response = json
  end

  File.open('spec/responses/invalid_forecast_response.json') do |json|
    @invalid_response = json
  end

  describe 'format_data' do
    it 'Responseが適正でないときに例外が出るか' do
      expect(Forecast.format_data(@invalid_response)).to raise_error(RuntimeError)
    end

    it 'Responseが適正なときには例外は出ないか' do
    end

    it 'Responseから必要なデータを取得できているか' do
    end

    it 'forecastに正しく値が格納せれているか' do
    end
  end
end
