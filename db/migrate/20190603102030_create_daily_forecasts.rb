class CreateDailyForecasts < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_forecasts do |t|
      t.string :icon
      t.integer :time
      t.string :summary
      t.decimal :precipProbability
      t.decimal :temperatureHigh
      t.decimal :temperatureLow
    end
  end
end
