class Api::V1::AntipodesController < ApplicationController

  def show
    #build antipode model with lat and long params
    @antipode = antipode_lat_long
    #build weather response from antipode lat/long
    # options = {}
    # options[:include] = [:forecast]
    render json: AntipodeSerializer.new(@antipode)

  end

  private

  #I LOVE FAT CONTROLLERS
  def lat_lng
    @_lat_lng ||= $gmaps.geocode(params[:loc])[0][:geometry][:location]
  end

  def search_location
    $gmaps.reverse_geocode("#{antipode_data[:data][:lat]}", "#{antipode_data[:data][:lng]}")
  end

  def antipode_lat_long
    Antipode.new(antipode_data, params[:loc], search_location)
  end

  def antipode_data
    @antipode_data ||= service.antipode
  end

  def service
    @_service ||= AntipodeService.new(lat_lng)
  end

  def response_bod
    @_forecast ||= ForecastIO.forecast("#{@antipode.lat}","#{@antipode.lng}")
  end

  def antipode_forecast_params
    {
      summary: response_bod[:currently][:summary],
      temperature: response_bod[:currently][:temperature]
    }
  end


end
