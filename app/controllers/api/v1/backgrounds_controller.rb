class Api::V1::BackgroundsController < ApplicationController
  def show
    photo_info = flickr_service
    render json: BackgroundSerializer.new(Photo.new(photo_info[:photos][:photo][0]))
  end

  private

  def flickr_service
    @_photo_info ||= FlickrService.new(lat_lng).photo_info
  end

  def lat_lng
    @_lat_lng ||= $gmaps.geocode(params[:location])[0][:geometry][:location]
  end

end
