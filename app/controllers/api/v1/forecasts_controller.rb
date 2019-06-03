class Api::V1::ForecastsController < ApplicationController
  require 'google_maps_service'
  require 'forecast_io'
  # before_action :find_city, only: [:show]

  # GET /forecast
  def show
    city_state = params[:location].split(',')
    city = city_state[0]
    state = city_state[1]
    @city = City.find_by(city: city, state: state)
    options = {}
    options[:include] = [:currently_forecast, :daily_forecasts, :hourly_forecasts]

    render json: ForecastSerializer.new(@city, options).serialized_json
  end

  def create
    city_state = params[:location].split(',')
    city = city_state[0]
    state = city_state[1]
    if City.find_by(city: city, state: state)
      redirect_to api_v1_forecast
    else
      @city = City.new(city: city, state: state, lat: lat_lng[:lat], lng: lat_lng[:lng])
        if @city.save
          #create current weather model
          @city.create_currently_forecast(currently_params)
          #create hourly weather models
          response_bod[:hourly][:data].each do |hourly_weather|
            @city.hourly_forecasts.create(hourly_params(hourly_weather))
          end
          #create daily weather models
          response_bod[:daily][:data].each do |daily_weather|
            @city.daily_forecasts.create(daily_params(daily_weather))
          end
          render json: ForecastSerializer.new(@city)
        else
          render :json => { :errors => "incorrect city, state format" }
        end

    end
  end

  private

  def find_city
    city_state = params[:location].split(',')
    city = city_state[0]
    state = city_state[1]
    @city = City.find_by(city: city, state: state)
  end

  def lat_lng
    @_lat_lng ||= $gmaps.geocode(params[:location])[0][:geometry][:location]
  end

  def response_bod
    @_forecast ||= ForecastIO.forecast("#{@city.lat}","#{@city.lng}")
  end

  def currently_params
      {
        time: Time.now,
        temperature: response_bod[:currently][:temperature],
        summary: response_bod[:currently][:summary],
        apparentTemperature: response_bod[:currently][:apparentTemperature],
        icon: response_bod[:currently][:icon],
        humidity: response_bod[:currently][:humidity],
        visibility: response_bod[:currently][:visibility],
        uvIndex: response_bod[:currently][:uvIndex],
        futureSummary: response_bod[:hourly][:summary],
        temperatureHigh: response_bod[:daily][:data][0][:temperatureHigh],
        temperatureLow: response_bod[:daily][:data][0][:temperatureLow]
      }
  end

  def hourly_params(hourly_weather)
      {
        time: hourly_weather[:time],
        temperature: hourly_weather[:temperature]
      }
  end

  def daily_params(daily_weather)
    {
      icon: daily_weather[:icon],
      time: daily_weather[:time],
      summary: daily_weather[:summary],
      precipProbability: daily_weather[:precipProbability],
      temperatureHigh: daily_weather[:temperatureHigh],
      temperatureLow: daily_weather[:temperatureLow]
    }
  end

end
