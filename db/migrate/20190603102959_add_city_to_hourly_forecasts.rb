class AddCityToHourlyForecasts < ActiveRecord::Migration[5.2]
  def change
    add_reference :hourly_forecasts, :hourly_forecast, foreign_key: true
  end
end
