class City < ApplicationRecord
  has_one :currently_forecast
  has_many :daily_forecasts
  has_many :hourly_forecasts


end
