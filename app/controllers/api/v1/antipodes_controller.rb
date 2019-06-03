class Api::V1::AntipodesController < ApplicationController

  def show
    #build antipode model with lat and long params
    @antipode = antipode_lat_long
    #build weather response from antipode lat/long
    #serialized_json
    render json: AntipodeSerializer.new(@antipode).serialized_json
  end

  private

  #I LOVE FAT CONTROLLERS
  def lat_lng
    @_lat_lng ||= $gmaps.geocode(params[:loc])[0][:geometry][:location]
  end

  def search_location
    $gmaps.reverse_geocode([antipode_data[:data][:attributes][:lat], antipode_data[:data][:attributes][:long]])
  end

  def antipode_lat_long
    Antipode.new(antipode_data, params[:loc], search_location[0][:formatted_address], antipode_forecast_params)
  end

  def antipode_data
    @antipode_data ||= service.antipode
  end

  def service
    @_service ||= AntipodeService.new(lat_lng)
  end

  def response_bod
    @_forecast ||= ForecastIO.forecast("#{@antipode.lat}","#{@antipode.long}")
  end

  def antipode_forecast_params
    {
      summary: response_bod[:currently][:summary],
      temperature: response_bod[:currently][:temperature]
    }
  end


end
