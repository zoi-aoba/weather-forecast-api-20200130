require 'rails_helper'

RSpec.describe Forecast, type: :model do
  it '摂氏と華氏の変換が正しいか' do
    expect(Forecast.convert_celsius(100)).to eq(37.8)
  end
end
