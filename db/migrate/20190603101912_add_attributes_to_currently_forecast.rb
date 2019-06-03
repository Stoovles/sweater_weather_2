class AddAttributesToCurrentlyForecast < ActiveRecord::Migration[5.2]
  def change
    add_column :currently_forecasts, :temperatureHigh, :decimal
    add_column :currently_forecasts, :temperatureLow, :decimal
  end
end
