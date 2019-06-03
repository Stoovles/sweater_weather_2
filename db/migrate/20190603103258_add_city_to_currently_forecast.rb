class AddCityToCurrentlyForecast < ActiveRecord::Migration[5.2]
  def change
    add_reference :currently_forecasts, :city, foreign_key: true
  end
end
