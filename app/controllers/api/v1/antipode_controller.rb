class Api::V1::AntipodesController < ApplicationController

  def show
    antipode = antipode_lat_long
    binding.pry
    results = $gmaps.reverse_geocode([antipode.lat, antipode.long])
  end





  private

  def antipode_lat_long
    antipode_data.map do |pode_data|
      Antipode.new(pode_data)
    end
  end

    def antipode_data
      @antipode_data ||= service.antipode
    end


    def service
      @_service ||= AntipodeService.new(params)
    end

end
