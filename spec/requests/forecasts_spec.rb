require 'rails_helper'

describe ForecastIO do
  context 'instance methods' do
    it 'retrieves correct forecast information' do
      forecast = ForecastIO.forecast("22.3193039", "114.1693611")
      expect(forecast).to be_a(Hash)
      expect(forecast[:latitude]).to eq(22.3193039)
      expect(forecast[:longitude]).to eq(114.1693611)
    end
  end
end
