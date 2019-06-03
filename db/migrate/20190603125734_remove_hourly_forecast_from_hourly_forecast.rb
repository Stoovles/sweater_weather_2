class RemoveHourlyForecastFromHourlyForecast < ActiveRecord::Migration[5.2]
  def change
    remove_reference :hourly_forecasts, :hourly_forecast, foreign_key: true
  end
end
