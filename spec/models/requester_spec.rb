require 'rails_helper'
require 'httpclient'

RSpec.describe Requester, type: :model do
  describe '#get_data' do
    it '正しくHTTPリクエストができているか' do
      url = 'https://qiita.com/'
      response = Requester.get_data(url)
      expect(response.status).to eq 200
    end
  end

  describe '#check_response' do
    it 'Responseが200以外の時例外を出せるか' do
      url = 'https://test.com'
      response = HTTPClient.get(url)
      expect { Requester.check_response(response) }.to raise_error(RuntimeError)
    end

    it 'Responseが200の時例外を出さないか' do
      url = 'https://qiita.com/'
      response = HTTPClient.get(url)
      expect { Requester.check_response(response) }.not_to raise_error(RuntimeError)
    end
  end

  describe 'app_idは正しく取得できるか' do
    it 'app_idが空ではないか' do
      expect(Rails.application.credentials.aws[:app_id]).not_to be_empty
    end
  end
end
