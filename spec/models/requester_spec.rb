require 'rails_helper'

RSpec.describe Requester, type: :model do
  describe 'get_data' do
    it '正しくHTTPリクエストができているか' do
    end
  end

  describe 'make_forecast_url' do
    it '正しくURLが作成できているか' do
    end
  end

  describe 'make_observed_weather_url' do
    it '正しくURLが作成できているか' do
    end
  end

  describe 'check_response' do
    it 'Responseが200以外の時例外を出せるか' do
    end

    it 'Responseが200の時例外を出さないか' do
    end
  end
end
