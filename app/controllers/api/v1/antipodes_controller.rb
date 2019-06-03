class Api::V1::AntipodesController < ApplicationController

  def show
    antipode = antipode_lat_long
    results = $gmaps.reverse_geocode([antipode.lat, antipode.long])
  end

  private

  def lat_lng
    @_lat_lng ||= $gmaps.geocode(params[:loc])[0][:geometry][:location]
  end

  def antipode_lat_long
    Antipode.new(antipode_data[:data][:attributes])
  end

  def antipode_data
    @antipode_data ||= service.antipode
  end

  def service
    @_service ||= AntipodeService.new(lat_lng)
  end

end
