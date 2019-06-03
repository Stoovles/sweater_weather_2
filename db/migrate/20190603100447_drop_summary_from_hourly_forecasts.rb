class DropSummaryFromHourlyForecasts < ActiveRecord::Migration[5.2]
  def change
    remove_column :hourly_forecasts, :summary
    add_column :currently_forecasts, :futureSummary, :string
  end
end
