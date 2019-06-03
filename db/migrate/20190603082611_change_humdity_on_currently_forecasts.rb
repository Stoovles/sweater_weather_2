class ChangeHumdityOnCurrentlyForecasts < ActiveRecord::Migration[5.2]
  def change
    rename_column :currently_forecasts, :humditiy, :humidity

  end
end
