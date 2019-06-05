class UserFavorites
  attr_reader :id,
              :favorites

  def initialize(favorites)
    @id = self.object_id
    @favorites = favorites
  end

  def weather_info
    weather = @favorites.map do |favorite|
      {
        location: "#{favorite.city.city}, #{favorite.city.state}",
        weather:
        {
            current_weather: favorite.city.currently_forecast,
            hourly_weather: favorite.city.hourly_forecasts,
            daily_weather: favorite.city.daily_forecasts
        }
      }
    end
  end
end
