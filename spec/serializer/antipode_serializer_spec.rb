require 'rails_helper'

describe AntipodeSerializer do
  context 'instance methods' do
    it 'outputs correct JSON' do
      lat_lng = $gmaps.geocode('hongkong')[0][:geometry][:location]
      antipode_data = AntipodeService.new(lat_lng).antipode
      search_location = $gmaps.reverse_geocode([22.3193039,114.1693611])

      antipode_forecast_params =
      {
        summary: "Clear Skies",
        temperature: 77.0
      }

      antipode = Antipode.new(antipode_data, 'hongkong', search_location[0][:formatted_address], antipode_forecast_params)

      #SO CLOSE TO FINISHING THIS TEST!!!
    end
  end
end
