class RemoveCurrentlyForecastFromCurrentlyForecast < ActiveRecord::Migration[5.2]
  def change
    remove_reference :currently_forecasts, :currently_forecast, index: true, foreign_key: true
  end
end
