class Antipode
  attr_reader :lat, :long

  def initialize(data)
    @lat = data[:attributes][:lat]
    @long = data[:attributes][:long]
  end
end
