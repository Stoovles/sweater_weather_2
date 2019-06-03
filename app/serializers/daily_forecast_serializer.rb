class DailyForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :icon,
             :time,
             :summary,
             :precipProbability,
             :temperatureHigh,
             :temperatureLow
end
