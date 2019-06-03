class CreateHourlyForecasts < ActiveRecord::Migration[5.2]
  def change
    create_table :hourly_forecasts do |t|
      t.integer :time
      t.decimal :temperature
    end
  end
end
