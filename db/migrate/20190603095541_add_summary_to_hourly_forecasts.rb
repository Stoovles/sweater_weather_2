class AddSummaryToHourlyForecasts < ActiveRecord::Migration[5.2]
  def change
    add_column :hourly_forecasts, :summary, :string
  end
end
