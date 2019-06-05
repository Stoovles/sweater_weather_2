class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :city


  def location
    " #{self.city.city} , #{self.city.state}"
  end

  def current_weather
    self.city.currently_forecast
  end

  def hourly_weather
    self.city.hourly_forecasts
  end

  def daily_weather
    self.city.daily_forecasts
  end
end
