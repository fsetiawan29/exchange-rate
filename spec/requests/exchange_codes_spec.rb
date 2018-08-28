require 'rails_helper'

RSpec.describe 'Exchange Code API', type: :request do

  describe 'GET /exchange_codes' do

    before do
      create_list(:exchange_code, 10)

      get '/exchange_codes'
    end

    it 'returns exchange codes' do
      expect(json).to_not be_empty
      expect(json["error"]).to be(false)
      expect(json["exchange_codes"].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /exchange_codes' do
    before do
      params = { exchange_code: { code_from: 'USD', code_to: 'IDR' } }

      post '/exchange_codes', params: params
    end

    it 'creates a exchange code' do
      expect(json["error"]).to be(false)
      expect(json["message"]).to eq("Exchange Code successfully created")
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end
  end
end