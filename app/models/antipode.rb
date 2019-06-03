class Antipode
  attr_reader :lat, :long, :search_location, :antipode_city

  def initialize(data, search_location, antipode_city)
    @lat = data[:lat]
    @long = data[:long]
    @search_location = search_location
    @antipode_city = antipode_city
  end
end
