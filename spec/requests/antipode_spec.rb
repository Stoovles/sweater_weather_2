require 'rails_helper'

describe AntipodeService do
  context 'instance methods' do
    it 'retrieves proper antipode data' do
      lat_lng = $gmaps.geocode('hongkong')[0][:geometry][:location]
      service = AntipodeService.new(lat_lng)
      response = service.antipode
      expect(response).to be_a(Hash)
      expected =
      {
          "data": {
              "id": "1",
              "type": "antipode",
              "attributes": {
                  "lat": -22.3193039,
                  "long": -65.8306389
              }
          }
      }
      expect(response).to eq(expected)
    end
  end
end
