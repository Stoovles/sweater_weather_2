class RemoveDailyForecastFromDailyForecast < ActiveRecord::Migration[5.2]
  def change
    remove_reference :daily_forecasts, :daily_forecast, foreign_key: true
  end
end
