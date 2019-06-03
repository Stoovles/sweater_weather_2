class AddAttributesToCurrentlyForecasts < ActiveRecord::Migration[5.2]
  def change
    add_column :currently_forecasts, :time, :integer
    add_column :currently_forecasts, :summary, :string
    add_column :currently_forecasts, :icon, :string
    add_column :currently_forecasts, :temperature, :decimal
    add_column :currently_forecasts, :apparentTemperature, :decimal
    add_column :currently_forecasts, :humditiy, :decimal
    add_column :currently_forecasts, :visibility, :decimal
    add_column :currently_forecasts, :uvIndex, :integer
  end
end
