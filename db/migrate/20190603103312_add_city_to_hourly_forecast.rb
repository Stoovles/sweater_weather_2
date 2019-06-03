class AddCityToHourlyForecast < ActiveRecord::Migration[5.2]
  def change
    add_reference :hourly_forecasts, :city, foreign_key: true
  end
end
