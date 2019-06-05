class FavoritesSerializer
  include FastJsonapi::ObjectSerializer
  set_type :favorites

  def initialize(user_favorites)
    @user_favorites = user_favorites
  end

  def to_json(hash)
    @user_favorites.weather_info.to_json
  end

end
