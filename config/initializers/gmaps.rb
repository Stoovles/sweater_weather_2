require 'google_maps_service'
# Setup API keys
$gmaps = GoogleMapsService::Client.new(key: ENV["GEOCODING_API"]) do |config|
end
