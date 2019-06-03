class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :city,
             :state

  has_one :currently_forecast
  has_many :hourly_forecasts
  has_many :daily_forecasts


end
