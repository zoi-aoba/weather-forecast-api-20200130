require 'rails_helper'
require 'json'

RSpec.describe ObservedWeather, type: :model do
  describe '#convert_celsius' do
    it '摂氏と華氏の変換が正しいか' do
      expect(Forecast.convert_celsius(100)).to eq(37.8)
      expect(Forecast.convert_celsius(100)).to_not eq(100)
    end
  end

  describe '#format_data' do
    it 'Responseが適正でないときに例外が出るか' do
    end

    it 'Responseが適正なときに例外が出ないか' do
    end

    it 'Responseが適正なときには例外は出ないか' do
    end

    it 'Responseから必要なデータを取得できているか' do
    end

    it 'weatherに正しく値が格納されているか' do
    end
  end
end
