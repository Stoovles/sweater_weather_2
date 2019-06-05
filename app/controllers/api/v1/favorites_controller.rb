class Api::V1::FavoritesController < ApplicationController
  before_action :session_exists?

  def index
    render json: FavoritesSerializer.new(UserFavorites.new(Favorite.where(user_id: @user.id)))
  end

  def create
    if @user.favorites.where(user_id: @user.id).where(city_id: current_city[0].id).exists?
      render json: { :response => "Already favorited" , status: :conflict }
    else
      if current_city.exists?
        @user.favorites << Favorite.new(user_id: @user.id, city_id: current_city[0].id)
        render json: { :response => { api_key: @user.api_key, id: @user.cities.last.id }, :status => :created }
      else
        @city = City.new(city: city_attr, state: state_attr, lat: lat_lng[:lat], lng: lat_lng[:lng])
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

            @user.favorites << Favorite.new(user_id: @user.id, city_id: @city.id)
            render json: { :response => { api_key: @user.api_key, city_id: @user.cities.last.id }, :status => :created }
          end
      end
    end
  end


  def destroy
    favorite = @user.favorites.find_by(user_id: @user.id, city_id: current_city[0].id).destroy
    render json: FavoritesSerializer.new(UserFavorites.new([favorite]))
  end

  private

  def session_exists?
    @user = User.find_by(api_key: params[:api_key])
    status :unauthorized unless @user
  end

  def city_attr
    city_state = params[:location].split(',')
    city_state[0]
  end

  def state_attr
    city_state = params[:location].split(',')
    city_state[1]
  end

  def lat_lng
    @_lat_lng ||= $gmaps.geocode(params[:location])[0][:geometry][:location]
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

  def response_bod
    @_forecast ||= ForecastIO.forecast("#{@city.lat}","#{@city.lng}")
  end

  def current_city
    @_current_city ||= City.where(city: city_attr, state: state_attr, lat: lat_lng[:lat], lng: lat_lng[:lng])
  end

end
