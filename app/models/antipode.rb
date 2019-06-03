class Antipode
  attr_reader :id, :lat, :long, :search_location, :antipode_city, :current_temperature, :summary

  def initialize(data, search_location, antipode_city, forecast)
    @id = self.object_id
    @lat = data[:data][:attributes][:lat]
    @long = data[:data][:attributes][:long]
    @search_location = search_location
    @antipode_city = antipode_city
    @summary = forecast[:summary]
    @current_temperature = forecast[:temperature]
  end
end
