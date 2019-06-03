class AddCityToDailyForecast < ActiveRecord::Migration[5.2]
  def change
    add_reference :daily_forecasts, :city, foreign_key: true
  end
end
