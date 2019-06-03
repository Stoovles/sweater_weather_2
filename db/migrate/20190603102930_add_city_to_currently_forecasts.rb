class AddCityToCurrentlyForecasts < ActiveRecord::Migration[5.2]
  def change
    add_reference :currently_forecasts, :currently_forecast, foreign_key: true
  end
end
