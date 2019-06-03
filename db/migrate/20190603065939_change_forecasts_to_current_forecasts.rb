class ChangeForecastsToCurrentForecasts < ActiveRecord::Migration[5.2]
  def change
    rename_table :forecasts, :currently_forecasts
  end
end
