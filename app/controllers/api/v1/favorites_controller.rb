class Api::V1::FavoritesController < ApplicationController
  before_action :session_exists?

  def create
    if @user.cities.where(city: city_attr).where(state: state_attr).exists?
      render json: { :response => "Already favorited" , status: :conflict }
    else
      @user.cities.create(city: city_attr, state: state_attr, lat: lat_lng[:lat], lng: lat_lng[:lng])
      render json: { :response => { api_key: @user.api_key, id: @user.cities.last.id }, :status => :created }
    end
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

end
