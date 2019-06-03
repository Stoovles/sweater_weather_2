require 'rails_helper'

describe GoogleMapsService do
  context 'instance methods' do
    it 'retrieves correct lat_lng' do
      lat_lng = $gmaps.geocode('hongkong')[0][:geometry][:location]
      expect(lat_lng).to be_a(Hash)
      expect(lat_lng[:lat]).to equal(22.3193039)
      expect(lat_lng[:lng]).to equal(114.1693611)
    end

    it 'retrieves correct reverse geocode location' do
      location = $gmaps.reverse_geocode([22.3193039, 114.1693611])
      expect(location[0][:formatted_address]).to include("Hong Kong")
    end
  end
end
