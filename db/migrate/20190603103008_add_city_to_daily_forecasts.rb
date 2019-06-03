class AddCityToDailyForecasts < ActiveRecord::Migration[5.2]
  def change
    add_reference :daily_forecasts, :daily_forecast, foreign_key: true
  end
end
