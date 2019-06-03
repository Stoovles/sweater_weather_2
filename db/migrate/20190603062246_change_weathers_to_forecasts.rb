class ChangeWeathersToForecasts < ActiveRecord::Migration[5.2]
  def change
    rename_table :weathers, :forecasts
  end
end
